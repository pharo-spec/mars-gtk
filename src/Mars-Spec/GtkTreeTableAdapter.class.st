Class {
	#name : #GtkTreeTableAdapter,
	#superclass : #GtkTableAdapter,
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #private }
GtkTreeTableAdapter >> items [

	^ self model roots
]

{ #category : #private }
GtkTreeTableAdapter >> storeClass [

	^ GtkTreeStore
]
