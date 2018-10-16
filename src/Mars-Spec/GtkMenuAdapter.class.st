Class {
	#name : #GtkMenuAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #factory }
GtkMenuAdapter >> buildWidget [

	^ GtkMenuBar new
]
