Class {
	#name : #GtkMenuAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkMenuAdapter >> buildWidget [

	^ GtkMenuBar new
]
