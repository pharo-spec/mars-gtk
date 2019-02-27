Class {
	#name : #GtkColumnedListAdapter,
	#superclass : #GtkAbstractListAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkColumnedListAdapter >> addColumn: aTableColumn to: aGtkTreeView [ 
	
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
GtkColumnedListAdapter >> addModelTo: gtkList [
		
	super addModelTo: gtkList.
		
	gtkList headersVisible: self model isShowingColumnHeaders.

	self model selection isMultipleSelection 
		ifTrue: [gtkList beMultipleSelectionMode] 
		ifFalse: [gtkList beSingleSelectionMode].
				
	self model columns do: [ :aColumn | self addColumn: aColumn to: gtkList ].	
	
	self model columns ifNotEmpty: [gtkList model: self newTreeStore].
	
	gtkList selection unselectAll.

	self presenter selection isEmpty 
		ifFalse: [ self presenter selection selectedIndexes 
				do: [ :anIndex | gtkList selection selectPath: { anIndex } ]  ].
	
	self presenter selection whenChangedDo: [ 
		self presenter selection selectedIndexes 
				do: [ :anIndex | gtkList selection selectPath: { anIndex } ]].
	
	widget := gtkList.
	self connectSelectionChanged
]

{ #category : #building }
GtkColumnedListAdapter >> newTreeStore [
	
	| typeTransformer columnTypes store |
	
	typeTransformer := GtkSpecColumnTypeVisitor new forString: [ GType G_TYPE_STRING ].
		
	columnTypes := self model columns collect: [ :aColumn | aColumn acceptColumnVisitor: typeTransformer ].
	store := GtkTreeStore newColumnTypes: columnTypes.
	
	self model model shownItems do: [ :anItem | | row valueTransformer |
		row := store appendNew.

		valueTransformer :=GtkSpecColumnTypeVisitor new
			columns: self model columns;
			forString: [ :column :index | | aValue |
				aValue := (column readObject: anItem) asString.
				row at: index - 1 putString: aValue ].
			
		self model columns do: [ :aColumn | aColumn acceptColumnVisitor: valueTransformer ].
	].

	^ store
]
