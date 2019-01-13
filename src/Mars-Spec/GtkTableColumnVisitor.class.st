Class {
	#name : #GtkTableColumnVisitor,
	#superclass : #Object,
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #visiting }
GtkTableColumnVisitor >> visit: aTableColumn [

	^ aTableColumn acceptColumnBuilder: self
]

{ #category : #visiting }
GtkTableColumnVisitor >> visitImageColumn: aTableColumn [
]

{ #category : #visiting }
GtkTableColumnVisitor >> visitStringColumn: aTableColumn [
]
