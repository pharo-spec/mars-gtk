Class {
	#name : #GtkTextAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkTextAdapter >> buildWidget [
	| textView |

	textView := GtkTextView new.
	self model isForSmalltalkCode ifTrue: [ 
		textView monospace: true  ].
	^ GtkScrolledWindow newWidget: textView
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
