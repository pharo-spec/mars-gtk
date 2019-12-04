Class {
	#name : #GtkSearchInputFieldAdapter,
	#superclass : #GtkTextInputFieldAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #private }
GtkSearchInputFieldAdapter >> widgetClass [

	^ GtkSearchEntry 
]
