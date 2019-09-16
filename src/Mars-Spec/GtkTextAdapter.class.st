Class {
	#name : #GtkTextAdapter,
	#superclass : #GtkAbstractTextAdapter,
	#traits : 'TGtkHaveWrappingScrollBars',
	#classTraits : 'TGtkHaveWrappingScrollBars classTrait',
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

	gtkTextView beWrapWord.
	gtkTextView connectKeyPressEvent: [ :event |
		self handleKeyEvent: event ].
	gtkTextView textBuffer connectChanged: [ 
		self updatePresenterText: gtkTextView text ]

]

{ #category : #building }
GtkTextAdapter >> bufferClass [

	^ GtkTextBuffer
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
