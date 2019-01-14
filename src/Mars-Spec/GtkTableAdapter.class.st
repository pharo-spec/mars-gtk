Class {
	#name : #GtkTableAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #building }
GtkTableAdapter >> addModelTo: gtkWidget [
	| columnBuilder store |
	
	store := self newStoreFrom: self items.
	gtkWidget model: store.
	
	columnBuilder := GtkTableColumnBuilder on: self model.
	columnBuilder store: store.
	self model columns withIndexDo: [ :each :index | 
		gtkWidget appendColumn: (columnBuilder
			columnIndex: index;
			visit: each) ].
]

{ #category : #private }
GtkTableAdapter >> addRow: anObject into: store [
	| gtkRow columnFiller |
	
	gtkRow := store appendNew.
	columnFiller := GtkTableColumnFiller new
		gtkRow: gtkRow;
		row: anObject;
		yourself.
		
	self model columns withIndexDo: [ :eachColumn :index | 
		columnFiller
			columnIndex: index;
			visit: eachColumn ].
		
	^ gtkRow
]

{ #category : #building }
GtkTableAdapter >> buildWidget [
	| gtkTextView |

	gtkTextView := self newWidget.
	self addModelTo: gtkTextView.
	^ GtkScrolledWindow newWidget: gtkTextView
]

{ #category : #private }
GtkTableAdapter >> fillStore: store with: aCollection [
	
	aCollection do: [ :each | 
		self 
			addRow: each 
			into: store ]
]

{ #category : #private }
GtkTableAdapter >> items [

	^ self model items
]

{ #category : #'private factory' }
GtkTableAdapter >> newStore [
	| typeCollector |

	typeCollector := GtkTableColumnTypeCollector new.
	^ self storeClass newColumnTypes: (self model columns collect: [ :each |
		typeCollector visit: each ])
]

{ #category : #'private factory' }
GtkTableAdapter >> newStoreFrom: aCollection [
	| store |

	store := self newStore.
	self 
		fillStore: store
		with: aCollection.

	^ store
]

{ #category : #updating }
GtkTableAdapter >> refreshList [

	widget model: (self newStoreFrom: self model items)
]

{ #category : #private }
GtkTableAdapter >> storeClass [

	^ GtkListStore
]

{ #category : #updating }
GtkTableAdapter >> update: aSymbol [

	aSymbol == #items ifTrue: [ self refreshList ]
]

{ #category : #building }
GtkTableAdapter >> widgetClass [
	
	^ GtkTreeView
]
