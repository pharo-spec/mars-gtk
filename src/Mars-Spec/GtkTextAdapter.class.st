Class {
	#name : #GtkTextAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkTextAdapter >> buildWidget [

	^ GtkScrolledWindow newWidget: GtkTextView new
]
