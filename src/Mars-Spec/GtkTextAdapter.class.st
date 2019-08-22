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

{ #category : #'spec protocol' }
GtkTextAdapter >> setSelectionFromModel: aSelection [
 
	self innerWidget ifNotNil: [ :w | 
		w textBuffer 
			selectFrom: aSelection first - 1
			to: aSelection last ]
]

{ #category : #building }
GtkTextAdapter >> widgetClass [

	^ GtkTextView
]
