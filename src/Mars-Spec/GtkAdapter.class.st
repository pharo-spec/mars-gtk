Class {
	#name : #GtkAdapter,
	#superclass : #SpAbstractAdapter,
	#instVars : [
		'lastShownMenu',
		'backendUpdating',
		'dispatcher'
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

{ #category : #initialization }
GtkAdapter >> adapt: aPresenter [

	GtkRunLoop defer: [ 
		^ super adapt: aPresenter ]
]

{ #category : #building }
GtkAdapter >> addKeyBindingsTo: gtkWidget [

	self presenter contextKeyBindings ifNotNil: [ :aCategory | 
		self configureKeyBindings: gtkWidget. 
		aCategory allEntries keymaps do: [ :each |
			self 
				bindKeyCombination: each shortcut
				toAction: each action ] ]
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

	self presenter styles 
		do: [ :each | gtkWidget addClass: each ].
	
	gtkWidget sensitive: self presenter isEnabled.
	self presenter help ifNotNil: [ gtkWidget tooltipText: self presenter help ].
	self presenter whenEnabledChangedDo: [ gtkWidget sensitive: self presenter isEnabled ].
	
	self presenter isVisible
		ifTrue: [ gtkWidget show ]
		ifFalse: [ gtkWidget hide ].
	self presenter whenVisibleChangedDo: [ :aValuable |
		aValuable value
			ifTrue: [ gtkWidget show ]
			ifFalse: [ gtkWidget hide ] ].
]

{ #category : #'private cycle detection' }
GtkAdapter >> backendDetectCyclesDo: aBlock [ 

	self isBackendUpdating ifTrue: [ ^ self ].
	^ aBlock value
]

{ #category : #'private cycle detection' }
GtkAdapter >> backendUpdatingDo: aBlock [ 
	"This is a general mechanism to avoid colisions. 
	 I'm adding it for the cases where a presenter can be updated in two directions: from the 
	 user and from the backend. 
	 A tipical example of this is SpTextPresenter>>text:, who can be updated from the UI, but 
	 also needs to be updated from the backend to keep the text property updated."
	| oldStatus |

	oldStatus := backendUpdating.
	backendUpdating := true.
	aBlock ensure: [ 
		backendUpdating := oldStatus ]
]

{ #category : #protocol }
GtkAdapter >> bindKeyCombination: aShortcut toAction: aBlock [ 
	
	dispatcher ifNil: [ 
		self configureKeyBindings: self widget ].
	
	dispatcher 
		bindKeyCombination: aShortcut 
		toAction: aBlock
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
	self addKeyBindingsTo: gtkWidget.
	self addModelTo: gtkWidget.
	^ self wrapWidget: gtkWidget
]

{ #category : #private }
GtkAdapter >> configureKeyBindings: gtkWidget [
		
	dispatcher := GtkKMDispatcher on: self presenter.
	gtkWidget connectKeyPressEvent: [ :event |
		self handleKeyEvent: event ].
	
]

{ #category : #protocol }
GtkAdapter >> doTakeKeyboardFocus [

	self innerWidgetDo: [ :w | 
		self presenter withWindowDo: [ :window | 
			window adapter
				ifNotNil: [ w grabFocus ]
				ifNil: [ w deferAction: [ w grabFocus ] ] ] ]
]

{ #category : #accessing }
GtkAdapter >> enabled [

	^ self innerWidget sensitive
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

{ #category : #private }
GtkAdapter >> handleKeyEvent: event [

	event isModifier ifTrue: [ ^ false ].

	dispatcher ifNotNil: [
		dispatcher dispatchKeyEvent: event.
		^ event wasHandled ].
	
	^ false
]

{ #category : #testing }
GtkAdapter >> hasWidget [

	^ widget notNil
]

{ #category : #accessing }
GtkAdapter >> helpText [

	^ self innerWidget tooltipText
]

{ #category : #testing }
GtkAdapter >> initialize [

	super initialize.
	backendUpdating := false
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

{ #category : #'private cycle detection' }
GtkAdapter >> isBackendUpdating [

	^ backendUpdating
]

{ #category : #visibility }
GtkAdapter >> isVisible [
	
	^ self innerWidget isConfiguredVisible
]

{ #category : #emulating }
GtkAdapter >> keyPressed: keyCode shift: shiftBoolean meta: metaBoolean control: controlBoolean option: optionBoolean [

	self innerWidget 
		withCallbacksOfType: GKeyPressEventCallback 
		do: [ :aCallback | 
			aCallback valueWithArguments: { 
				self innerWidget getHandle. 
				(GdkEventKey 
					newKeyPressValue: keyCode
					shift: shiftBoolean
					meta: metaBoolean
					control: controlBoolean
					option: optionBoolean) 
				getHandle.
				ExternalAddress null } ]
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
