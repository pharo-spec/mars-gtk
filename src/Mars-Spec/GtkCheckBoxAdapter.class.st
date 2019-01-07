Class {
	#name : #GtkCheckBoxAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #factory }
GtkCheckBoxAdapter >> newWidget [

	^ GtkCheckButton newLabel: self model label
]
