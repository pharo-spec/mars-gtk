Class {
	#name : #GtkTableRowFiller,
	#superclass : #GtkTableColumnVisitor,
	#instVars : [
		'gtkRow',
		'row',
		'nextColumnIndex'
	],
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #accessing }
GtkTableRowFiller >> gtkRow [
	^ gtkRow
]

{ #category : #accessing }
GtkTableRowFiller >> gtkRow: anObject [
	gtkRow := anObject
]

{ #category : #accessing }
GtkTableRowFiller >> row [
	^ row
]

{ #category : #accessing }
GtkTableRowFiller >> row: anObject [
	row := anObject
]

{ #category : #visiting }
GtkTableRowFiller >> visitImageColumn: aTableColumn [

	self flag: #TODO. "I'm assuming the image is a Form, which may not be the case in the future"
	self gtkRow
		at: self columnIndex 
		putObject: (GdkPixbuf newForm: (aTableColumn readObject: self row))
]

{ #category : #visiting }
GtkTableRowFiller >> visitStringColumn: aTableColumn [

	self gtkRow
		at: self columnIndex
		put: (aTableColumn readObject: self row) asString utf8Encoded
]
