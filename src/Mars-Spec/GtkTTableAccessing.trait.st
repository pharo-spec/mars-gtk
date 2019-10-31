Trait {
	#name : #GtkTTableAccessing,
	#instVars : [
		'objectCache'
	],
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkTTableAccessing >> addColumn: aTableColumn to: aGtkTreeView [ 
	| addColumnVisitor |
	
	addColumnVisitor := GtkTableColumnBuilder new
		columns: self model columns;
		view: aGtkTreeView;
		yourself.
		
	aTableColumn acceptColumnVisitor: addColumnVisitor
]

{ #category : #building }
GtkTTableAccessing >> addColumnsTo: gtkWidget [

	self model columns do: [ :aColumn | 
		self addColumn: aColumn to: gtkWidget ].	
]

{ #category : #building }
GtkTTableAccessing >> addRows: aCollection to: store [

	GtkTableRowFillerCache 
		value: self objectCache
		during: [ 
			aCollection withIndexDo: [ :anItem :index |
			self doAddRow: anItem index: index into: store ] ]
]

{ #category : #building }
GtkTTableAccessing >> addShownRowsTo: store [

	self 
		addRows: self presenter model items
		to: store
]

{ #category : #building }
GtkTTableAccessing >> doAddRow: anObject index: rowIndex into: store [
	| row valueTransformer |

	row := store appendNew.
	valueTransformer := GtkTableRowFiller new
		columns: self model columns;
		gtkRow: row;
		row: anObject;
		rowIndex: rowIndex;
		yourself.

	self model columns do: [ :aColumn | 
		aColumn acceptColumnVisitor: valueTransformer ]
]

{ #category : #factory }
GtkTTableAccessing >> newTreeStore [
	| typeCollector store |
	
	typeCollector := GtkTableColumnTypeCollector new.
	self model columns do: [ :each | 
		typeCollector visit: each ].
	store := GtkTreeStore newColumnTypes: typeCollector types.
	self addShownRowsTo: store.

	^ store
]

{ #category : #private }
GtkTTableAccessing >> objectCache [

	^ objectCache ifNil: [ objectCache := IdentityDictionary new ]
]

{ #category : #private }
GtkTTableAccessing >> sortableItemAt: index [ 
	
	^ self presenter model items at: index
]
