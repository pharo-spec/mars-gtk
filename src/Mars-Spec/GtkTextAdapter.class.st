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
		self handleKeyEvent: event ]
]

{ #category : #building }
GtkTextAdapter >> widgetClass [

	^ GtkTextView
]
