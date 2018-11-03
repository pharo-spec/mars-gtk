Class {
	#name : #GtkButtonAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #factory }
GtkButtonAdapter >> buildWidget [

	^ (GtkButton newLabel: self model label asString)
		connectClicked: self model action;
		yourself
]
