Class {
	#name : #GtkLabelAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #factory }
GtkLabelAdapter >> buildWidget [

	^ GtkLabel newLabel: self model label
]
