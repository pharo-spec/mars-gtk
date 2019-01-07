Class {
	#name : #GtkLabelAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #factory }
GtkLabelAdapter >> newWidget [

	^ GtkLabel newLabel: self model label
]
