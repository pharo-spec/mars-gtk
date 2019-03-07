Class {
	#name : #GtkColumnedListAdapter,
	#superclass : #GtkAbstractListAdapter,
	#category : #'Mars-Spec-Adapter-List'
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

	gtkList
		headersVisible: self model isShowingColumnHeaders;
		beSingleSelectionMode.
		
	self model columns do: [ :aColumn | self addColumn: aColumn to: gtkList ].	
	
	gtkList model: self newTreeStore.

	gtkList selection unselectAll.
	
	self presenter selection isEmpty 
		ifFalse: [ gtkList selection selectPath: self presenter selection selectedIndexes ].
	
	gtkList
		connectSelectionChanged: [ 
			self presenter selection selectIndexes: gtkList allSelected flattened ]
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
