Class {
	#name : #GtkAdapter,
	#superclass : #AbstractAdapter,
	#instVars : [
		'lastShownMenu'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #specs }
GtkAdapter class >> adaptingName [
	"Answers the name this component adapts."

	"Remove the 'Gtk' part will almost always give us the adapter name"
	^ (self name allButFirst: 3) asSymbol
]

{ #category : #initialize }
GtkAdapter class >> allAdapters [

	^ self allSubclasses
]

{ #category : #testing }
GtkAdapter class >> isAbstract [ 

	^ self = GtkAdapter
]

{ #category : #building }
GtkAdapter >> addMenu: aValuable to: gtkWidget [

	gtkWidget connectRightClicked: [ :event |
		lastShownMenu := self buildMenu: aValuable value.
		lastShownMenu 
			connectDestroy: [ lastShownMenu := nil ];
			showAll;
			popupAtPointer: event.
		true ]
]

{ #category : #building }
GtkAdapter >> addModelTo: gtkWidget [
]

{ #category : #building }
GtkAdapter >> addSettingsTo: gtkWidget [
	"A secondary initialization generic to all widgets"
	
	gtkWidget sensitive: self presenter isEnabled.
	self presenter help ifNotNil: [ gtkWidget tooltipText: self presenter help ].
	self presenter whenEnabledChanged: [ gtkWidget sensitive: self presenter isEnabled ].
	
	self presenter isVisible
		ifTrue: [ gtkWidget show ]
		ifFalse: [ gtkWidget hide ].
	self presenter whenVisibleChangedDo: [ :value |
		value
			ifTrue: [ gtkWidget show ]
			ifFalse: [ gtkWidget hide ] ].
]

{ #category : #building }
GtkAdapter >> buildMenu: aMenuPresenter [

	^ aMenuPresenter 
		owner: self model;
		buildWithSpec
]

{ #category : #building }
GtkAdapter >> buildWidget [ 
	| gtkWidget |
	
	gtkWidget := self newWidget.
	self addSettingsTo: gtkWidget.
	self addModelTo: gtkWidget.
	^ self wrapWidget: gtkWidget
]

{ #category : #protocol }
GtkAdapter >> doTakeKeyboardFocus [

	self innerWidgetDo: [ :w | 
		self model window ifNotNil: [ :window | 
			window adapter
				ifNotNil: [ w grabFocus ]
				ifNil: [ w deferAction: [ w grabFocus ] ] ] ]
]

{ #category : #accessing }
GtkAdapter >> enabled [

	^ self widget sensitive
]

{ #category : #accessing }
GtkAdapter >> enabled: aBoolean [

	self widgetDo: [ :w |
		w sensitive: aBoolean ]
]

{ #category : #'as yet unclassified' }
GtkAdapter >> gtInspectorPreviewIn: aGLMCompositePresentation [
	"Do nothing at the moment"
]

{ #category : #testing }
GtkAdapter >> hasWidget [

	^ widget notNil
]

{ #category : #accessing }
GtkAdapter >> helpText [

	^ self innerWidget tooltipText
]

{ #category : #'private accessing' }
GtkAdapter >> innerWidget [
	"this is the widget to be used internally (to operate). 
	 this is because widgets can be wrapped and we need to use the actual widget to 
	 config the adapter. 
	 Most of the cases, this the same as #widget"
	
	^ widget
]

{ #category : #accessing }
GtkAdapter >> innerWidgetDo: aBlock [

	self hasWidget ifFalse: [ ^ nil ].
	^ aBlock value: self innerWidget
]

{ #category : #visibility }
GtkAdapter >> isVisible [
	
	^ widget isConfiguredVisible
]

{ #category : #protocol }
GtkAdapter >> layout: aSpecLayoutFrame [ 
	
	self flag: #TODO.
]

{ #category : #building }
GtkAdapter >> newWidget [

	^ self widgetClass new
]

{ #category : #emulating }
GtkAdapter >> rightClicked [
	
	self innerWidget 
		withCallbacksOfType: GSecondaryButtonPressEventCallback 
		do: [ :aCallback |
			aCallback valueWithArguments: {
				self innerWidget getHandle.
				GdkEventButton newRightClick getHandle.
				ExternalAddress null } ]
]

{ #category : #accessing }
GtkAdapter >> setBalloonText: aString [ 
	
	^ self innerWidget ifNotNil: [ 
		self innerWidget tooltipText: aString ]
]

{ #category : #protocol }
GtkAdapter >> takeKeyboardFocus [

	self doTakeKeyboardFocus
]

{ #category : #updating }
GtkAdapter >> update: aSymbol with: anArray [

	self flag: #TODO. "I'm not sure I want to do this :("
	self 
		perform: aSymbol 
		withArguments: anArray
]

{ #category : #updating }
GtkAdapter >> updateMenu [
	| existingCallbacks menu |

	self hasWidget ifFalse: [ ^ self ].

	existingCallbacks := Set new.
	self innerWidget 
		withCallbacksOfType: GSecondaryButtonPressEventCallback 
		do: [ :each | existingCallbacks add: each ].
		
	menu := self model contextMenu. 
	menu ifNil: [ 
		existingCallbacks do: [ :each | each disconnectFrom: self innerWidget ].
		^ self ].
	"if there is already a callback, I do not need to do anything (because it will be 
	 evaluated each time)"
	existingCallbacks ifNotEmpty: [ ^ self ].
	"Now, actually add the menu callback"
	self addMenu: menu to: self innerWidget
]

{ #category : #building }
GtkAdapter >> widgetClass [

	^ self subclassResponsibility
]

{ #category : #building }
GtkAdapter >> wrapWidget: gtkWidget [

	^ gtkWidget
]

{ #category : #'private utils' }
GtkAdapter >> wrapWithScrollableWindow: gtkWidget [

	^ (GtkScrolledWindow newWidget: gtkWidget)
		show;
		yourself
]
