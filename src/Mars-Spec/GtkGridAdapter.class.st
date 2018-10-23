Class {
	#name : #GtkGridAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkGridAdapter >> add: anObject [ 

	self halt
]

{ #category : #building }
GtkGridAdapter >> buildWidget [

	^ GtkGrid new
]
