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
	
	columnBuilder := self newColumnBuilderOn: self model.
	columnBuilder store: store.
	columnBuilder view: gtkWidget. 
	self model columns do: [ :each | 
		columnBuilder visit: each ].
	
	gtkWidget headersVisible: self model isShowingColumnHeaders.
	
	gtkWidget connectSelectionChanged: [ 
		self rowSelected: gtkWidget selected ].
	
	self model doubleClickAction ifNotNil: [ :action |
		gtkWidget connectDoubleClicked: [ 
			action cull: self model selectedItem ] ]
]

{ #category : #private }
GtkTableAdapter >> addRow: anObject index: index into: store [
	| gtkRow filler |
	
	gtkRow := store appendNew.
	filler := GtkTableRowFiller new
		gtkRow: gtkRow;
		row: anObject;
		rowIndex: index;
		yourself.
		
	self model columns do: [ :eachColumn | 
		filler visit: eachColumn ].
		
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
	
	aCollection withIndexDo: [ :each :index | 
		self 
			addRow: each 
			index: index
			into: store ]
]

{ #category : #private }
GtkTableAdapter >> items [

	^ self model items
]

{ #category : #'private factory' }
GtkTableAdapter >> newColumnBuilderOn: anObject [

	^ GtkTableColumnBuilder on: anObject
]

{ #category : #'private factory' }
GtkTableAdapter >> newStore [
	| typeCollector |

	typeCollector := GtkTableColumnTypeCollector new.
	self model columns collect: [ :each | 
		typeCollector visit: each ].
	^ self storeClass newColumnTypes: typeCollector types
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
GtkTableAdapter >> rowSelected: path [

	self model selectedIndex: path first
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
