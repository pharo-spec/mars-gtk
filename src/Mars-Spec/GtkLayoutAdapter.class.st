Class {
	#name : #GtkLayoutAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Layout-Base'
}

{ #category : #testing }
GtkLayoutAdapter class >> isAbstract [ 

	^ super isAbstract 
		or: [ self = GtkLayoutAdapter ]
]
