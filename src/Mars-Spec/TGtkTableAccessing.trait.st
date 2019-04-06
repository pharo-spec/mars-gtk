Trait {
	#name : #TGtkTableAccessing,
	#category : #'Mars-Spec'
}

{ #category : #building }
TGtkTableAccessing >> addColumn: aTableColumn index: index to: aGtkTreeView [ 
	| addColumnVisitor |
	
	addColumnVisitor := GtkSpecColumnBuilderVisitor new
		index: index;
		treeView: aGtkTreeView;
		yourself.
		
	aTableColumn acceptColumnVisitor: addColumnVisitor.
]

{ #category : #building }
TGtkTableAccessing >> addColumnsTo: gtkWidget [

	self model columns withIndexDo: [ :aColumn :index | 
		self addColumn: aColumn index: index to: gtkWidget ].	
]

{ #category : #building }
TGtkTableAccessing >> addRows: aCollection to: store [

	aCollection withIndexDo: [ :anItem :index |
		self doAddRow: anItem index: index into: store ]
]

{ #category : #building }
TGtkTableAccessing >> addShownRowsTo: store [

	self 
		addRows: self model model shownItems
		to: store
]

{ #category : #building }
TGtkTableAccessing >> doAddRow: anObject index: rowIndex into: store [
	| row valueTransformer |

	row := store appendNew.
	valueTransformer := GtkTableRowFiller new
		gtkRow: row;
		row: anObject;
		rowIndex: rowIndex;
		yourself.

	self model columns withIndexDo: [ :aColumn :columnIndex | 
		valueTransformer columnIndex: columnIndex.
		aColumn acceptColumnVisitor: valueTransformer ]
]

{ #category : #factory }
TGtkTableAccessing >> newTreeStore [
	| typeCollector store |
	
	typeCollector := GtkTableColumnTypeCollector new.
	self model columns do: [ :each | 
		typeCollector visit: each ].
	store := GtkTreeStore newColumnTypes: typeCollector types.
	self addShownRowsTo: store.

	^ store
]
