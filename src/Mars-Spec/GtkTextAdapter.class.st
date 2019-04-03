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
		gtkTextView monospace: true  ]
]

{ #category : #visiting }
GtkTextAdapter >> setText: aString to: gtkTextView [

	self model isForSmalltalkCode
		ifTrue: [ gtkTextView methodText: aString class: Object ]
		ifFalse: [ super setText: aString to: gtkTextView ]
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
