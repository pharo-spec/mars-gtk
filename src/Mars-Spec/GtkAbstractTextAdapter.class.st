Class {
	#name : #GtkAbstractTextAdapter,
	#superclass : #GtkAdapter,
	#instVars : [
		'dispatcher'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkAbstractTextAdapter >> addMenu: aValuable to: gtkWidget [ 

	self shouldNotImplement
]

{ #category : #building }
GtkAbstractTextAdapter >> addModelTo: gtkWidget [

	super addModelTo: gtkWidget.
	self addTextTo: gtkWidget. 
	self model whenTextChangedDo: [ :text | 
		self setText: text to: gtkWidget ].
	self model additionalKeyBindings ifNotNil: [ :bindings |
		bindings keysAndValuesDo: [ :shortcut :action | 
			self bindKeyCombination: shortcut toAction: action ] ].
	gtkWidget connectPopulatePopup: [ :menuWidget |
		self populatePopup: menuWidget  ]
]

{ #category : #building }
GtkAbstractTextAdapter >> addTextTo: gtkWidget [
	
	self model text ifNotNil: [ :text | 
		self setText: text to: gtkWidget ].

]

{ #category : #private }
GtkAbstractTextAdapter >> bindKeyCombination: aShortcut toAction: aBlock [ 
	
	dispatcher ifNil: [ dispatcher := GtkKMDispatcher on: self model ].
	dispatcher 
		bindKeyCombination: aShortcut 
		toAction: aBlock
]

{ #category : #private }
GtkAbstractTextAdapter >> handleKeyEvent: event [

	dispatcher ifNotNil: [ 
		dispatcher dispatchKeyEvent: event.
		^ event wasHandled ].
	
	^ false
]

{ #category : #building }
GtkAbstractTextAdapter >> populatePopup: menuWidget [
	| newMenu menuPresenter |
	
	menuPresenter := self model contextMenu value.
	menuPresenter ifNil: [ ^ self ].
	
	lastShownMenu := menuWidget.
	newMenu := self buildMenu: menuPresenter.
	newMenu children reverseDo: [ :each |
		newMenu remove: each.
		menuWidget addFirst: each.
		each show ]
]

{ #category : #emulating }
GtkAbstractTextAdapter >> rightClicked [
	
	self innerWidget 
		withCallbacksOfType: GPopulatePopupCallback 
		do: [ :aCallback |
			aCallback valueWithArguments: {
				self innerWidget getHandle.
				GtkMenu new getHandle.
				ExternalAddress null } ]
]

{ #category : #selection }
GtkAbstractTextAdapter >> selectAll [
	
	self widget selectAll
]

{ #category : #accessing }
GtkAbstractTextAdapter >> setText: aString to: gtkWidget [

	gtkWidget text: aString asString
]

{ #category : #accessing }
GtkAbstractTextAdapter >> text: aString [ 
	
	self setText: aString to: widget
]
