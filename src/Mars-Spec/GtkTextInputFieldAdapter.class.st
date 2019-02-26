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
	self model placeholder
		ifNotNil: [ :text | gtkEntry placeHolderText: text ]
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

{ #category : #building }
GtkTextInputFieldAdapter >> wrapWidget: gtkWidget [

	^ gtkWidget
]
