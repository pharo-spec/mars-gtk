Class {
	#name : #GtkCheckBoxAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #factory }
GtkCheckBoxAdapter >> buildWidget [ 

	^ GtkCheckButton newLabel: self model label
]
