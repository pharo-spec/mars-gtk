Class {
	#name : #GtkTableAdapter,
	#superclass : #GtkAdapter,
	#instVars : [
		'columnFiller'
	],
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #building }
GtkTableAdapter >> addModelTo: gtkWidget [
	| columnBuilder store |
	
	store := self newStoreFrom: self model items.
	gtkWidget model: store.
	
	columnBuilder := GtkTableColumnBuilder on: self model.
	columnBuilder store: store.
	self model columns withIndexDo: [ :each :index | 
		gtkWidget appendColumn: (columnBuilder
			columnIndex: index;
			visit: each) ].
]

{ #category : #building }
GtkTableAdapter >> buildWidget [
	| gtkTextView |

	gtkTextView := self newWidget.
	self addModelTo: gtkTextView.
	^ GtkScrolledWindow newWidget: gtkTextView
]

{ #category : #building }
GtkTableAdapter >> newStoreFrom: aCollection [
	| store typeCollector |

	typeCollector := GtkTableColumnTypeCollector new.
	store := GtkListStore newColumnTypes: (self model columns collect: [ :each |
		typeCollector visit: each ]).
	columnFiller := GtkTableColumnFiller new.
	aCollection do: [ :eachRow | | gtkRow |
		gtkRow := store appendRow.
		columnFiller
			gtkRow: gtkRow;
			row: eachRow.
		self model columns withIndexDo: [ :eachColumn :index | 
			 columnFiller 
				columnIndex: index;
				visit: eachColumn ] ].

	^ store
]

{ #category : #updating }
GtkTableAdapter >> refreshList [

	widget model: (self newStoreFrom: self model items)
]

{ #category : #updating }
GtkTableAdapter >> update: aSymbol [

	aSymbol == #items ifTrue: [ self refreshList ]
]

{ #category : #building }
GtkTableAdapter >> widgetClass [
	
	^ GtkTreeView
]
