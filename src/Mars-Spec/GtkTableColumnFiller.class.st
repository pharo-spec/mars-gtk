Class {
	#name : #GtkTableColumnFiller,
	#superclass : #GtkTableColumnVisitor,
	#instVars : [
		'gtkRow',
		'row',
		'columnIndex'
	],
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #accessing }
GtkTableColumnFiller >> columnIndex [
	^ columnIndex
]

{ #category : #accessing }
GtkTableColumnFiller >> columnIndex: anObject [
	columnIndex := anObject
]

{ #category : #accessing }
GtkTableColumnFiller >> gtkRow [
	^ gtkRow
]

{ #category : #accessing }
GtkTableColumnFiller >> gtkRow: anObject [
	gtkRow := anObject
]

{ #category : #accessing }
GtkTableColumnFiller >> row [
	^ row
]

{ #category : #accessing }
GtkTableColumnFiller >> row: anObject [
	row := anObject
]

{ #category : #visiting }
GtkTableColumnFiller >> visitImageColumn: aTableColumn [

	self flag: #TODO. "I'm assuming the image is a Form, which may not be the case in the future"
	self gtkRow
		at: self columnIndex - 1 
		putObject: (GdkPixbuf newForm: (aTableColumn readObject: self row))
]

{ #category : #visiting }
GtkTableColumnFiller >> visitStringColumn: aTableColumn [

	self gtkRow
		at: self columnIndex - 1 
		put: (aTableColumn readObject: self row) asString utf8Encoded
]
