Class {
	#name : #GtkTextInputFieldAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkTextInputFieldAdapter >> addModelTo: gtkEntry [ 

	self model ghostText ifNotNil: [ :text | 
		gtkEntry placeHolderText: text ]
]

{ #category : #building }
GtkTextInputFieldAdapter >> buildWidget [
	| gtkEntry |
	
	gtkEntry := GtkEntry new.
	self addModelTo: gtkEntry.
	^ gtkEntry
]
