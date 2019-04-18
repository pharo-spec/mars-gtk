Class {
	#name : #GtkTextAdapter,
	#superclass : #GtkAbstractTextAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #visiting }
GtkTextAdapter >> accept [

	self widgetDo: [ :w | 
		self model acceptText: w child text ]
]

{ #category : #visiting }
GtkTextAdapter >> addModelTo: gtkTextView [

	super addModelTo: gtkTextView.
	gtkTextView beWrapWord
]

{ #category : #building }
GtkTextAdapter >> widgetClass [

	^ GtkTextView
]

{ #category : #building }
GtkTextAdapter >> wrapWidget: gtkWidget [

	^ self wrapWithScrollableWindow: gtkWidget
]
