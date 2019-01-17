Class {
	#name : #GtkTreeTableColumnBuilder,
	#superclass : #GtkTableColumnBuilder,
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #private }
GtkTreeTableColumnBuilder >> nodeFromPath: path [
	
	^ self model itemAtPath: ((path substrings: ':') collect: [ :each | each asNumber + 1 ])
]
