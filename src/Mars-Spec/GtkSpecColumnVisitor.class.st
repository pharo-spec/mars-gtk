Class {
	#name : #GtkSpecColumnVisitor,
	#superclass : #GtkTableColumnVisitor,
	#instVars : [
		'index'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #accessing }
GtkSpecColumnVisitor >> index [

	^ index
]

{ #category : #accessing }
GtkSpecColumnVisitor >> index: aNumber [

	index := aNumber
]
