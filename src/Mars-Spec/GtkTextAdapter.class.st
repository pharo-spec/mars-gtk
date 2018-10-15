Class {
	#name : #GtkTextAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkTextAdapter >> buildWidget [
	| textView |

	textView := GtkTextView new.
	self model isForSmalltalkCode ifTrue: [ 
		textView monospace: true  ].
	^ GtkScrolledWindow newWidget: textView
]
