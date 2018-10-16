Class {
	#name : #GtkMenuGroupAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkMenuGroupAdapter >> buildWidget [

	^ GtkMenu new
]
