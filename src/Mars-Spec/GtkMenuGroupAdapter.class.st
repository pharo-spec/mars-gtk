Class {
	#name : #GtkMenuGroupAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #factory }
GtkMenuGroupAdapter >> buildWidget [

	^ GtkMenu new
]
