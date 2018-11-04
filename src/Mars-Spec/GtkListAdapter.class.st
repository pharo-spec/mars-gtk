Class {
	#name : #GtkListAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #specs }
GtkListAdapter class >> adaptingAliases [

	^ #(FastTableAdapter)
]

{ #category : #building }
GtkListAdapter >> addModelTo: gtkList [
	
]

{ #category : #building }
GtkListAdapter >> buildWidget [
	| gtkList |
	
	gtkList := GtkTreeView new.
	self addModelTo: gtkList.
	^ gtkList			
]
