Class {
	#name : #GtkTableColumnPacker,
	#superclass : #GtkTableColumnVisitor,
	#instVars : [
		'builder',
		'column',
		'expand'
	],
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #'instance creation' }
GtkTableColumnPacker class >> on: aModel [

	^ self new model: aModel
]

{ #category : #accessing }
GtkTableColumnPacker >> builder [
	^ builder
]

{ #category : #accessing }
GtkTableColumnPacker >> builder: anObject [
	builder := anObject
]

{ #category : #accessing }
GtkTableColumnPacker >> column [
	^ column
]

{ #category : #accessing }
GtkTableColumnPacker >> column: anObject [
	column := anObject
]

{ #category : #accessing }
GtkTableColumnPacker >> columnIndex: aNumber [

	columnIndex := aNumber
]

{ #category : #accessing }
GtkTableColumnPacker >> expand: anObject [
	expand := anObject
]

{ #category : #visiting }
GtkTableColumnPacker >> initialize [

	super initialize.
	self expand: true
]

{ #category : #testing }
GtkTableColumnPacker >> isExpand [

	^ expand
]

{ #category : #'private factory' }
GtkTableColumnPacker >> newEditableTextRendererFor: aTableColumn [
	| renderer |
	
	renderer := GtkCellRendererText new.
	renderer beEditable.
	renderer connectEdited: [ :path :text | 
		self builder 
			columnEdited: aTableColumn 
			path: path 
			text: text ].

	^ renderer
]

{ #category : #'private factory' }
GtkTableColumnPacker >> newImageRenderer [

	^ GtkCellRendererPixbuf new
]

{ #category : #'private factory' }
GtkTableColumnPacker >> newTextRenderer [

	^ GtkCellRendererText new
]

{ #category : #visiting }
GtkTableColumnPacker >> visitCompositeColumn: aTableColumn [
	
	self error: 'Should now arrive here!'
]

{ #category : #visiting }
GtkTableColumnPacker >> visitImageColumn: aTableColumn [
	| renderer |

	renderer := self newImageRenderer.
	column packStart: renderer expand: self isExpand.
	column 
		addAttribute: 'pixbuf' 
		column: self columnIndex 
		renderer: renderer
]

{ #category : #visiting }
GtkTableColumnPacker >> visitStringColumn: aTableColumn [
	| renderer |
	
	renderer := aTableColumn isEditable 
		ifTrue: [ self newEditableTextRendererFor: aTableColumn ]
		ifFalse: [ self newTextRenderer ].
	
	column packStart: renderer expand: self isExpand.
	column 
		addAttribute: 'text' 
		column: self columnIndex 
		renderer: renderer
]
