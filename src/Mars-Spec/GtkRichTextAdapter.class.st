Class {
	#name : #GtkRichTextAdapter,
	#superclass : #GtkTextAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkRichTextAdapter >> setText: text to: gtkWidget [
	
	super 
		setText: self presenter plaintext 
		to: gtkWidget
]

{ #category : #building }
GtkRichTextAdapter >> widgetClass [

	^ GtkRichTextView
]
