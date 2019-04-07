Class {
	#name : #GtkTableAdapter,
	#superclass : #GtkBaseListAdapter,
	#traits : 'TGtkTableAccessing',
	#classTraits : 'TGtkTableAccessing classTrait',
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #building }
GtkTableAdapter >> addModelTo: gtkTreeView [
		
	super addModelTo: gtkTreeView.
		
	gtkTreeView headersVisible: self model isShowingColumnHeaders.

	self model selection isMultipleSelection 
		ifTrue: [ gtkTreeView beMultipleSelectionMode ] 
		ifFalse: [ gtkTreeView beSingleSelectionMode ].
				
	self addColumnsTo: gtkTreeView.
	
	self model columns ifNotEmpty: [
		gtkTreeView model: self newTreeStore ].
	
	gtkTreeView selection unselectAll.

	self presenter selection isEmpty ifFalse: [ 
		self presenter selection selectedIndexes 
			do: [ :anIndex | gtkTreeView selection selectPath: { anIndex } ]  ].
	
	self presenter selection whenChangedDo: [ 
		self presenter selection selectedIndexes 
			do: [ :anIndex | gtkTreeView selection selectPath: { anIndex } ] ].
	
	self presenter whenShowColumnHeadersChangedDo: [ 	
		gtkTreeView headersVisible: self model isShowingColumnHeaders ].
		
	gtkTreeView connectRowActivated: [ :path | 
		self model doActivateAtIndex: path toArray first ].

	widget := gtkTreeView.
	
	self presenter whenColumnsChangedDo: [ 
		self refreshWidgetHeaderTitle. 
		self refreshList ].
	
	self refreshWidgetHeaderTitle.
	
	gtkTreeView connectSelectionChanged: [ 
		self presenter selection selectIndexes: gtkTreeView allSelected flattened ].

]

{ #category : #private }
GtkTableAdapter >> appendAddedColumns [
	| columns |
	
	columns := self model columns.  
	(columns last: (columns size - widget columns size)) do: [ :aTableColumn | 
		self 
			addColumn: aTableColumn 
			to: widget ]	
]

{ #category : #testing }
GtkTableAdapter >> isShowColumnHeaders [

	^ widget isHeadersVisible
]

{ #category : #events }
GtkTableAdapter >> refreshWidgetHeaderTitle [
	
	"By now I only accept to add columns, as the data should be all generated. It is not so easy"
	(widget columns size < self model columns size) 
		ifTrue: [ self appendAddedColumns ].
	
	self model columns 
		with: widget columns 
		do: [ :modelColumn :widgetColumn | widgetColumn title: modelColumn title ]
]
