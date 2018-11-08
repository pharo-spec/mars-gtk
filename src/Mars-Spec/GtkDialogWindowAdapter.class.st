Class {
	#name : #GtkDialogWindowAdapter,
	#superclass : #GtkWindowAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkDialogWindowAdapter >> buildWidget [

	^ GtkDialog new 
		autoRelease
		resize: self model initialExtent;
		yourself
]
