Class {
	#name : #GtkTextAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #visiting }
GtkTextAdapter >> accept [

	self widgetDo: [ :w | 
		self model acceptText: w child text ]
]

{ #category : #building }
GtkTextAdapter >> addModelTo: gtkTextView [
	
	gtkTextView beWrapWord.
	self model isForSmalltalkCode ifTrue: [ 
		gtkTextView monospace: true  ].
	self model text ifNotNil: [ :text |
		gtkTextView text: text asString ]
]

{ #category : #private }
GtkTextAdapter >> refreshText [
	
	self widgetDo: [ :w |
		w child text: (self model text ifNil: [ '' ]) ]
]

{ #category : #updating }
GtkTextAdapter >> update: aSymbol [

	aSymbol = #getText ifTrue: [ self refreshText ].

	^ super update: aSymbol
]

{ #category : #building }
GtkTextAdapter >> widgetClass [

	^ GtkTextView
]

{ #category : #building }
GtkTextAdapter >> wrapWidget: gtkWidget [

	^ GtkScrolledWindow newWidget: gtkWidget
]
