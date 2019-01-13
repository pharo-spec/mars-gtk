Class {
	#name : #GtkTableColumnBuilder,
	#superclass : #GtkTableColumnVisitor,
	#instVars : [
		'model',
		'store',
		'textRenderer',
		'imageRenderer',
		'columnIndex'
	],
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #'instance creation' }
GtkTableColumnBuilder class >> on: aModel [

	^ self new model: aModel
]

{ #category : #private }
GtkTableColumnBuilder >> columnEdited: aTableColumn path: path text: text [
	| node iter |
	
	node := self nodeFromPath: path.
	
	"process edition"
	aTableColumn acceptAction 
		value: node 
		value: text.
	"store the new value (or restore the old valur)"
	iter := self store iteratorFromString: path.
	iter 
		at: self columnIndex 
		putString: node stringValue
]

{ #category : #accessing }
GtkTableColumnBuilder >> columnIndex [ 

	^ columnIndex
]

{ #category : #accessing }
GtkTableColumnBuilder >> columnIndex: aNumber [

	columnIndex := aNumber
]

{ #category : #private }
GtkTableColumnBuilder >> imageRenderer [

	^ imageRenderer ifNil: [ imageRenderer := GtkCellRendererPixbuf new ]
]

{ #category : #accessing }
GtkTableColumnBuilder >> model [

	^ model
]

{ #category : #accessing }
GtkTableColumnBuilder >> model: anObject [
	model := anObject
]

{ #category : #'private factory' }
GtkTableColumnBuilder >> newColumnFor: aTableColumn [
	| column |

	column := GtkTreeViewColumn new.
	column title: aTableColumn title.
	aTableColumn width ifNotNil: [ :w | 
		column minWidth: w ].
		
	^ column
]

{ #category : #'private factory' }
GtkTableColumnBuilder >> newEditableTextRendererFor: aTableColumn [
	| renderer |
	
	renderer := GtkCellRendererText new.
	renderer beEditable.
	renderer connectEdited: [ :path :text | 
		self columnEdited: aTableColumn path: path text: text ].
		
	^ renderer
]

{ #category : #private }
GtkTableColumnBuilder >> nodeFromPath: path [
	
	self flag: #TODO. "A tree will have a different behaviour"
	^ self model itemAt: 	((path substrings: ':') first asNumber + 1)
]

{ #category : #accessing }
GtkTableColumnBuilder >> store [ 

	^ store 
]

{ #category : #accessing }
GtkTableColumnBuilder >> store: anObject [
	store := anObject
]

{ #category : #private }
GtkTableColumnBuilder >> textRenderer [

	^ textRenderer ifNil: [ textRenderer := GtkCellRendererText new ]
]

{ #category : #visiting }
GtkTableColumnBuilder >> visitImageColumn: aTableColumn [
	| column |
	
	column := self newColumnFor: aTableColumn.

	column renderer: self imageRenderer.
	column 
		setAttribute: 'pixbuf' 
		toColumAtIndex: self columnIndex - 1 
		forRenderer: self imageRenderer.

	^ column
]

{ #category : #visiting }
GtkTableColumnBuilder >> visitStringColumn: aTableColumn [
	| column renderer |
	
	column := self newColumnFor: aTableColumn.
	
	renderer := aTableColumn isEditable 
		ifTrue: [ self newEditableTextRendererFor: aTableColumn ]
		ifFalse: [ self textRenderer ].
	
	column renderer: renderer.
	column 
		setAttribute: 'text' 
		toColumAtIndex: self columnIndex - 1 
		forRenderer: renderer.

	^ column
]
