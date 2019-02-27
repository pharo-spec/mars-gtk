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
GtkTextAdapter >> addToModel: gtkTextView [

	gtkTextView beWrapWord.
	
	self model isForSmalltalkCode ifTrue: [ 
		gtkTextView monospace: true  ].

]

{ #category : #building }
GtkTextAdapter >> buildWidget [
	| gtkTextView |

	gtkTextView := self newWidget.
	self addModelTo: gtkTextView.
	^ GtkScrolledWindow newWidget: gtkTextView
]

{ #category : #building }
GtkTextAdapter >> widgetClass [

	^ GtkTextView
]
