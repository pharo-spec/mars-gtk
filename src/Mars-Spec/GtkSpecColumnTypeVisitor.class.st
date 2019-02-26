Class {
	#name : #GtkSpecColumnTypeVisitor,
	#superclass : #Object,
	#instVars : [
		'stringColumnBlock',
		'columnCollection'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #accessing }
GtkSpecColumnTypeVisitor >> columns: aCollection [ 
	columnCollection := aCollection.
]

{ #category : #accessing }
GtkSpecColumnTypeVisitor >> forString: aBlockClosure [ 
	
	stringColumnBlock := aBlockClosure
]

{ #category : #visiting }
GtkSpecColumnTypeVisitor >> visitStringColumn: aStringTableColumn [ 
	
	| index |
	index := columnCollection ifNotNil: [ columnCollection indexOf: aStringTableColumn ].
	^ stringColumnBlock cull: aStringTableColumn cull: index
]
