Class {
	#name : #GtkSpecColumnTypeVisitor,
	#superclass : #GtkSpecColumnVisitor,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #visiting }
GtkSpecColumnTypeVisitor >> visitIndexColumn: anIndexTableColumn [

	^ GType G_TYPE_UINT
]

{ #category : #visiting }
GtkSpecColumnTypeVisitor >> visitStringColumn: aStringTableColumn [
 
	^ GType G_TYPE_STRING
]
