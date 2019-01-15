Class {
	#name : #GtkTableColumnBuilder,
	#superclass : #GtkTableColumnVisitor,
	#instVars : [
		'model',
		'store',
		'view'
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
GtkTableColumnBuilder >> newColumnPackerFor: column [

	^ GtkTableColumnPacker new 
		column: column;
		builder: self;
		columnIndex: self columnIndex;
		yourself
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

{ #category : #accessing }
GtkTableColumnBuilder >> view [
	^ view
]

{ #category : #accessing }
GtkTableColumnBuilder >> view: anObject [
	view := anObject
]

{ #category : #visiting }
GtkTableColumnBuilder >> visitCompositeColumn: aTableColumn [
	| column packer |
	
	column := self newColumnFor: aTableColumn.
	packer := self newColumnPackerFor: column.	

	aTableColumn columns do: [ :each |
		packer 
			expand: each width isNil;
			visit: each.
		self nextColumnIndex ].
	self prevColumnIndex.
	
	self view appendColumn: column
]

{ #category : #visiting }
GtkTableColumnBuilder >> visitImageColumn: aTableColumn [
	
	self visitStringColumn: aTableColumn
]

{ #category : #visiting }
GtkTableColumnBuilder >> visitStringColumn: aTableColumn [
	| column |
	
	column := self newColumnFor: aTableColumn.
	(self newColumnPackerFor: column) visit: aTableColumn.
	self view appendColumn: column.
]
