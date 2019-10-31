"
I add the ""sortable columns"" trait to adapters who can use it (tables, trees, etc.)
"
Trait {
	#name : #GtkTSortableColumns,
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #private }
GtkTSortableColumns >> addSortableColumnsTo: gtkTreeView [
	| nextSortableId |
	
	nextSortableId := 0.
	self presenter 	columns withIndexDo: [ :each :index |
		each isSortable ifTrue: [ 
			| gtkColumn |
			gtkColumn := gtkTreeView columnAt: index.
			gtkColumn sortColumnId: nextSortableId.
			gtkTreeView model 
				sortBy: [ :itA :itB | 
					each sortFunction 
						collate: (self sortableItemAt: (itA toPathArray first))
						with: (self sortableItemAt: (itB toPathArray first)) ] 
				columnId: nextSortableId.
			nextSortableId := nextSortableId + 1 ] ]
]

{ #category : #private }
GtkTSortableColumns >> sortableItemAt: index [ 
	
	self required
]
