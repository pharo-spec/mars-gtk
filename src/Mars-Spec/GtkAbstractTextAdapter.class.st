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

	gtkWidget connectPopulatePopup: [ :menuWidget |
		self populatePopup: menuWidget with: aValuable ]
]

{ #category : #building }
GtkAbstractTextAdapter >> addModelTo: gtkWidget [

	super addModelTo: gtkWidget.
	self addTextTo: gtkWidget. 
	self model whenTextChangedDo: [ :text | 
		self setText: text to: gtkWidget ].
	self model contextMenu ifNotNil: [ :menu |
		self addMenu: menu to: gtkWidget ]
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
GtkAbstractTextAdapter >> populatePopup: menuWidget with: aValuable [
	| newMenu |
	
	lastShownMenu := menuWidget.
	newMenu := self buildMenu: aValuable value.
	newMenu children reverseDo: [ :each |
		newMenu remove: each.
		menuWidget addFirst: each.
		each show ]
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
