"
I add the ""sortable columns"" trait to adapters who can use it (tables, trees, etc.)
"
Trait {
	#name : #GtkTSortableColumns,
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #private }
GtkTSortableColumns >> addSortableColumn: aColumn at: index sortableId: sortableId to: gtkTreeView [
	| gtkColumn sortFunction |

	sortFunction := aColumn sortFunction.
	gtkColumn := gtkTreeView columnAt: index.
	gtkColumn sortColumnId: sortableId.

	sortFunction ifNil: [ ^ self ].

	gtkTreeView model
		connectSortColumnChanged: [ sortFunction := sortFunction reversed ];
		sortBy: [ :itA :itB | 
			sortFunction
				collate: (self sortableItemAt: (itA toPathArray first))
				with: (self sortableItemAt: (itB toPathArray first)) ] 
		columnId: sortableId
]

{ #category : #private }
GtkTSortableColumns >> addSortableColumnsTo: gtkTreeView [
	| nextSortableId |
	
	nextSortableId := 0.
	self columns withIndexDo: [ :each :index |
		each isSortable ifTrue: [ 
			self addSortableColumn: each at: index sortableId: nextSortableId to: gtkTreeView.
			nextSortableId := nextSortableId + 1 ] ]
]

{ #category : #'private accessing' }
GtkTSortableColumns >> columns [ 

	^ self required
]

{ #category : #private }
GtkTSortableColumns >> sortableItemAt: index [ 
	
	self required
]
