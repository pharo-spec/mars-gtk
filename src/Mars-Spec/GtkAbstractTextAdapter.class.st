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

	event isModifier ifTrue: [ ^ false ].

	dispatcher ifNotNil: [
		dispatcher dispatchKeyEvent: event.
		^ event wasHandled ].
	
	^ false
]

{ #category : #'spec protocol' }
GtkAbstractTextAdapter >> insert: aString at: positionIndex [

	self innerWidgetDo: [ :w |
		w textBuffer 
			insertText: aString 
			at: positionIndex - 1 ]
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

{ #category : #'spec protocol' }
GtkAbstractTextAdapter >> selectLine [

	self innerWidget ifNotNil: [ :w | 
		w textBuffer selectLineAtCursor ]
]

{ #category : #'spec protocol' }
GtkAbstractTextAdapter >> selection [ 

	^ self innerWidget 
		ifNotNil: [ :w | 
			| selection |
			selection := w textBuffer selection.
			selection ifNotNil: [ 
				selection first + 1 to: selection last ] ]	
		ifNil: [ 
			1 to: 0 ]
]

{ #category : #'spec protocol' }
GtkAbstractTextAdapter >> setSelectionFromModel: aSelection [
 
	self innerWidget ifNotNil: [ :w | 
		w textBuffer 
			selectFrom: aSelection first - 1
			to: aSelection last ]
]

{ #category : #accessing }
GtkAbstractTextAdapter >> setText: aString to: gtkWidget [

	gtkWidget text: aString asString
]

{ #category : #accessing }
GtkAbstractTextAdapter >> text: aString [ 
	
	self setText: aString to: widget
]
