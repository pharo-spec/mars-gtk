Class {
	#name : #GtkTableRowFiller,
	#superclass : #GtkTableColumnVisitor,
	#instVars : [
		'gtkRow',
		'row',
		'rowIndex'
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
GtkTableRowFiller >> nextColumnIndex [ 

	super nextColumnIndex.
	
]

{ #category : #accessing }
GtkTableRowFiller >> row [
	^ row
]

{ #category : #accessing }
GtkTableRowFiller >> row: anObject [
	row := anObject
]

{ #category : #accessing }
GtkTableRowFiller >> rowIndex [
	^ rowIndex
]

{ #category : #accessing }
GtkTableRowFiller >> rowIndex: anObject [
	rowIndex := anObject
]

{ #category : #visiting }
GtkTableRowFiller >> visitImageColumn: aTableColumn [

	self flag: #TODO. "I'm assuming the image is a Form, which may not be the case in the future"
	self gtkRow
		at: self columnIndex 
		putObject: (GdkPixbuf newForm: (aTableColumn readObject: self row))
]

{ #category : #visiting }
GtkTableRowFiller >> visitIndexColumn: aTableColumn [

	self gtkRow
		at: self columnIndex
		put: self rowIndex asString utf8Encoded
]

{ #category : #visiting }
GtkTableRowFiller >> visitStringColumn: aTableColumn [

	self gtkRow
		at: self columnIndex
		put: (aTableColumn readObject: self row) asString utf8Encoded
]
