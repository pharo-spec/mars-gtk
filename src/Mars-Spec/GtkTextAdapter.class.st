Class {
	#name : #GtkTextAdapter,
	#superclass : #GtkAbstractTextAdapter,
	#traits : 'GtkTHaveWrappingScrollBars',
	#classTraits : 'GtkTHaveWrappingScrollBars classTrait',
	#category : #'Mars-Spec-Adapter'
}

{ #category : #visiting }
GtkTextAdapter >> accept [

	self innerWidgetDo: [ :w | 
		self model acceptText: w text ]
]

{ #category : #building }
GtkTextAdapter >> addModelTo: gtkTextView [

	super addModelTo: gtkTextView.

	gtkTextView editable: self presenter isEditable.
	self presenter whenEditableChangedDo: [ :value | self setEditable: value ].
	gtkTextView beWrapWord.
	gtkTextView textBuffer connectChanged: [
		self updatePresenterText: gtkTextView text ]

]

{ #category : #building }
GtkTextAdapter >> bufferClass [

	^ GtkTextBuffer
]

{ #category : #private }
GtkTextAdapter >> setEditable: aBoolean [ 

	self innerWidgetDo: [ :w | w editable: aBoolean ]
]

{ #category : #building }
GtkTextAdapter >> setText: aString to: gtkWidget [

	self backendDetectCyclesDo: [
		super setText: aString to: gtkWidget	]
]

{ #category : #private }
GtkTextAdapter >> updatePresenterText: aString [

	self backendUpdatingDo: [ 
		self presenter text: aString ]
]

{ #category : #building }
GtkTextAdapter >> widgetClass [

	^ GtkTextView
]
