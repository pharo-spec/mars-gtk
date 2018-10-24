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
	| gtkWidget |
	
	gtkWidget := self gtkWidgetClass new.
	self addModelTo: gtkWidget.
	^ gtkWidget
]

{ #category : #private }
GtkTextInputFieldAdapter >> gtkWidgetClass [

	^ GtkEntry
]
