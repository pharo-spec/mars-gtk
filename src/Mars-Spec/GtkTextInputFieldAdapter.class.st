Class {
	#name : #GtkTextInputFieldAdapter,
	#superclass : #GtkTextAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #visiting }
GtkTextInputFieldAdapter >> accept [ 
	
	self widgetDo: [ :w | 
		self model text: w text ]
]

{ #category : #building }
GtkTextInputFieldAdapter >> addModelTo: gtkEntry [

	self model ghostText ifNotNil: [ :text | 
		gtkEntry placeHolderText: text ]
]

{ #category : #building }
GtkTextInputFieldAdapter >> buildWidget [
	| gtkWidget |
	
	gtkWidget := self widgetClass new.
	self addModelTo: gtkWidget.
	^ gtkWidget
]

{ #category : #private }
GtkTextInputFieldAdapter >> refreshText [
	
	self widgetDo: [ :w |
		w text: self model text ]
]

{ #category : #private }
GtkTextInputFieldAdapter >> widgetClass [

	^ GtkEntry
]
