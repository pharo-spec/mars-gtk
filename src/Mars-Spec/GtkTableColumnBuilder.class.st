Class {
	#name : #GtkTableColumnBuilder,
	#superclass : #GtkTableColumnVisitor,
	#instVars : [
		'textRenderer',
		'imageRenderer',
		'columnIndex'
	],
	#category : #'Mars-Spec-Adapter'
}

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
		aTableColumn acceptAction 
			value: (self nodeFromPath: path)
			value: text ].
		
	^ renderer
]

{ #category : #private }
GtkTableColumnBuilder >> nodeFromPath: path [
	
	self halt
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
