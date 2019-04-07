Class {
	#name : #GtkTableColumnVisitor,
	#superclass : #Object,
	#instVars : [
		'columns'
	],
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #accessing }
GtkTableColumnVisitor >> columnIndex [

	^ columnIndex
]

{ #category : #accessing }
GtkTableColumnVisitor >> columnIndex: aNumber [

	self flag: #REMOVE.
	"columnIndex := aNumber"
]

{ #category : #accessing }
GtkTableColumnVisitor >> columnIndexOf: aTableColumn [

	^ (self columns indexOf: aTableColumn) - 1
]

{ #category : #accessing }
GtkTableColumnVisitor >> columns [

	^ columns
]

{ #category : #accessing }
GtkTableColumnVisitor >> columns: aCollection [

	columns := aCollection
]

{ #category : #accessing }
GtkTableColumnVisitor >> initialize [

	super initialize.
	self resetColumnIndex
]

{ #category : #accessing }
GtkTableColumnVisitor >> nextColumnIndex [

	self flag: #REMOVE.
	"columnIndex := columnIndex + 1"
]

{ #category : #accessing }
GtkTableColumnVisitor >> prevColumnIndex [

	self flag: #REMOVE.
	"columnIndex := columnIndex - 1"
]

{ #category : #accessing }
GtkTableColumnVisitor >> resetColumnIndex [

	self flag: #REMOVE.
	"columnIndex := 0"
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
GtkTableColumnVisitor >> visitIndexColumn: aTableColumn [
	
	^ self visitStringColumn: aTableColumn
]

{ #category : #visiting }
GtkTableColumnVisitor >> visitStringColumn: aTableColumn [
]
