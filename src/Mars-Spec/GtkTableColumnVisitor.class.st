Class {
	#name : #GtkTableColumnVisitor,
	#superclass : #Object,
	#instVars : [
		'columnIndex'
	],
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #accessing }
GtkTableColumnVisitor >> columnIndex [ 

	^ columnIndex
]

{ #category : #accessing }
GtkTableColumnVisitor >> initialize [

	super initialize.
	self resetColumnIndex
]

{ #category : #accessing }
GtkTableColumnVisitor >> nextColumnIndex [ 

	columnIndex := columnIndex + 1
]

{ #category : #accessing }
GtkTableColumnVisitor >> resetColumnIndex [ 

	columnIndex := 0
]

{ #category : #visiting }
GtkTableColumnVisitor >> visit: aTableColumn [

	aTableColumn acceptColumnVisitor: self.
	self nextColumnIndex
]

{ #category : #visiting }
GtkTableColumnVisitor >> visitCompositeColumn: aTableColumn [
	
	aTableColumn columns do: [ :each |
		self visit: each  ]
]

{ #category : #visiting }
GtkTableColumnVisitor >> visitImageColumn: aTableColumn [
]

{ #category : #visiting }
GtkTableColumnVisitor >> visitStringColumn: aTableColumn [
]
