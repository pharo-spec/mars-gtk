Class {
	#name : #GtkTableAdapter,
	#superclass : #GtkBaseListAdapter,
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #building }
GtkTableAdapter >> addColumn: aTableColumn to: aGtkTreeView [ 
	
	| addColumnVisitor |
	
	addColumnVisitor := GtkSpecColumnTypeVisitor new
		columns: self model columns;
		forString: [ :column :index | | renderer | 
			renderer := GtkCellRendererText new.
			aGtkTreeView appendColumn: (GtkTreeViewColumn new
			packStart: renderer;
			addAttribute: 'text' column: (index - 1) renderer: renderer)			
		].
		
	aTableColumn acceptColumnVisitor: addColumnVisitor.
]

{ #category : #building }
GtkTableAdapter >> addModelTo: gtkList [
		
	super addModelTo: gtkList.
		
	gtkList headersVisible: self model isShowingColumnHeaders.

	self model selection isMultipleSelection 
		ifTrue: [ gtkList beMultipleSelectionMode ] 
		ifFalse: [ gtkList beSingleSelectionMode ].
				
	self model columns do: [ :aColumn | 
		self 
			addColumn: aColumn 
			to: gtkList ].	
	
	self model columns ifNotEmpty: [
		gtkList model: self newTreeStore ].
	
	gtkList selection unselectAll.

	self presenter selection isEmpty ifFalse: [ 
		self presenter selection selectedIndexes 
			do: [ :anIndex | gtkList selection selectPath: { anIndex } ]  ].
	
	self presenter selection whenChangedDo: [ 
		self presenter selection selectedIndexes 
			do: [ :anIndex | gtkList selection selectPath: { anIndex } ]].
	
	self presenter whenShowColumnHeadersChangedDo: [ 	
		gtkList headersVisible: self model isShowingColumnHeaders ].
		
	gtkList connectRowActivated: [ :path | 
		self model doActivateAtIndex: path toArray first ].

	widget := gtkList.
	
	self presenter whenColumnsChangedDo: [ 
		self refreshWidgetHeaderTitle. 
		self refreshList ].
	
	self refreshWidgetHeaderTitle.
	
	gtkList connectSelectionChanged: [ 
		self presenter selection selectIndexes: gtkList allSelected flattened ].

]

{ #category : #testing }
GtkTableAdapter >> isShowColumnHeaders [

	^ widget isHeadersVisible
]

{ #category : #building }
GtkTableAdapter >> newTreeStore [
	| typeTransformer columnTypes store |
	
	typeTransformer := GtkSpecColumnTypeVisitor new forString: [ GType G_TYPE_STRING ].
		
	columnTypes := self model columns 
		collect: [ :aColumn | aColumn acceptColumnVisitor: typeTransformer ].
	store := GtkTreeStore newColumnTypes: columnTypes.
	
	self model model shownItems do: [ :anItem | | row valueTransformer |
		row := store appendNew.
		valueTransformer :=GtkSpecColumnTypeVisitor new
			columns: self model columns;
			forString: [ :column :index | | aValue |
				aValue := (column readObject: anItem) asString.
				row at: index - 1 putString: aValue ].
			
		self model columns do: [ :aColumn | 
			aColumn acceptColumnVisitor: valueTransformer ] ].

	^ store
]

{ #category : #events }
GtkTableAdapter >> refreshWidgetHeaderTitle [
	
	"By now I only accept to add columns, as the data should be all generated. It is not so easy"
	(widget columns size < self model columns size) 
		ifTrue: [  
			(self model columns last: (self model columns size - widget columns size)) 
				do: [ :aTableColumn | 
					self 
						addColumn: aTableColumn 
						to: widget  ] ].
	
	self model columns 
		with: widget columns 
		do: [ :modelColumn :widgetColumn | widgetColumn title: modelColumn title ]
]
