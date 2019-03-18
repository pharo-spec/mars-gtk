Class {
	#name : #GtkSliderAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkSliderAdapter >> addModelTo: gtkWidget [
	super addModelTo: gtkWidget.
	gtkWidget digits: self presenter value.
]

{ #category : #building }
GtkSliderAdapter >> newWidget [
	^ self presenter isHorizontal
		ifTrue: [ self widgetClass
				newHorizontalMin: self presenter min
				max: self presenter max
				step: self presenter quantum ]
		ifFalse: [ self widgetClass
				newVerticalMin: self presenter min
				max: self presenter max
				step: self presenter quantum ]
]

{ #category : #building }
GtkSliderAdapter >> widgetClass [
	^ GtkScale 
]
