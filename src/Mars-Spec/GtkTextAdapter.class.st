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
	gtkTextView beWrapWord.
	self model isForSmalltalkCode ifTrue: [ 
		"gtkTextView monospace: true."
		self addMonospaceStyleFor: gtkTextView ]
]

{ #category : #adding }
GtkTextAdapter >> addMonospaceStyleFor: gtkTextView [
	
	gtkTextView styleContext addProvider: self newCssProvider.
	
]

{ #category : #'as yet unclassified' }
GtkTextAdapter >> classOrMetaClass: anObject [
	"ignore, I do not need it right now"
]

{ #category : #visiting }
GtkTextAdapter >> setText: aString to: gtkTextView [

	self model isForSmalltalkCode ifFalse: [ ^ super setText: aString to: gtkTextView ].
	self model behavior 
		ifNotNil: [ gtkTextView methodText: aString class: Object ]
		ifNil: [ gtkTextView expressionText: aString ]
]

{ #category : #building }
GtkTextAdapter >> widgetClass [

	^ GtkTextView
]

{ #category : #building }
GtkTextAdapter >> wrapWidget: gtkWidget [

	^ (GtkScrolledWindow newWidget: gtkWidget) 
		show;
		yourself
]
