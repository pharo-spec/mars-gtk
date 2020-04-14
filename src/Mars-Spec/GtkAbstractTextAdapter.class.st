Class {
	#name : #GtkAbstractTextAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkAbstractTextAdapter >> addMenu: aValuable to: gtkWidget [ 
	"for texts, this is solved with #populatePopup:, see there to follow 
	 how it works."
	self shouldNotImplement
]

{ #category : #building }
GtkAbstractTextAdapter >> addModelTo: gtkWidget [

	super addModelTo: gtkWidget.
	self addTextTo: gtkWidget. 
	self presenter whenTextChangedDo: [ :text | 
		self setText: text to: gtkWidget ].
	gtkWidget connectPopulatePopup: [ :menuWidget |
		self populatePopup: menuWidget  ]
]

{ #category : #building }
GtkAbstractTextAdapter >> addTextTo: gtkWidget [
	
	self model text ifNotNil: [ :text | 
		self setText: text to: gtkWidget ].

]

{ #category : #'spec protocol' }
GtkAbstractTextAdapter >> insert: aString at: positionIndex [

	self innerWidgetDo: [ :w |
		w textBuffer 
			insertText: aString 
			at: positionIndex ]
]

{ #category : #building }
GtkAbstractTextAdapter >> populatePopup: menuWidget [
	| newMenu menuPresenter |
	
	menuPresenter := self model contextMenu value.
	menuPresenter ifNil: [ ^ self ].
	
	lastShownMenu := menuWidget.
	newMenu := self buildMenu: menuPresenter.
	newMenu children ifEmpty: [ ^ self ].
	
	menuWidget addFirst: GtkSeparatorMenuItem new show.
	newMenu children reverseDo: [ :each |
		each objectRef.
		newMenu remove: each.
		menuWidget addFirst: each.
		each objectUnref.
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
	
	self innerWidgetDo: [ :w | w textBuffer selectAll ]
]

{ #category : #selection }
GtkAbstractTextAdapter >> selectLine [

	self innerWidgetDo: [ :w | 
		w textBuffer selectLineAtCursor ]
]

{ #category : #selection }
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

{ #category : #selection }
GtkAbstractTextAdapter >> setSelectionFromModel: aSelection [
 
	self innerWidgetDo: [ :w | 
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
