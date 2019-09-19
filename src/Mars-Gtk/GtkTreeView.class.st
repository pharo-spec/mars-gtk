"
Simplified version of GtkTreeView to display lists
GtkTreeView — A widget for displaying both trees and lists

https://developer.gnome.org/gtk3/stable/GtkTreeView.html
"
Class {
	#name : #GtkTreeView,
	#superclass : #GtkContainer,
	#instVars : [
		'listStore',
		'selection',
		'columns'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #accessing }
GtkTreeView class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_tree_view_get_type())
]

{ #category : #'instance creation' }
GtkTreeView class >> new [

	^ self treeViewNew initialize
]

{ #category : #private }
GtkTreeView class >> treeViewNew [

	^ self ffiCall: #(#GtkTreeView *gtk_tree_view_new (void))
]

{ #category : #accessing }
GtkTreeView >> activateOnSingleClick: single [

	self ffiCall: #(void gtk_tree_view_set_activate_on_single_click (self, gboolean single))
]

{ #category : #simulating }
GtkTreeView >> activateRow: path column: column [ 

	self ffiCall: #(void gtk_tree_view_row_activated(self, GtkTreePath *path, GtkTreeViewColumn *column))

]

{ #category : #private }
GtkTreeView >> addExpanderColumn [

	self ffiCall: #(void gtk_tree_view_set_expander_column(self, 0))
]

{ #category : #accessing }
GtkTreeView >> allSelected [ 

	^ self selection allSelected 
]

{ #category : #columns }
GtkTreeView >> appendColumn: column [
	
	columns add: column.
	self basicAppendColumn: column
]

{ #category : #'convenience columns' }
GtkTreeView >> appendPixbufColumn: columnIndex [
	| renderer |

	renderer := GtkCellRendererPixbuf new.
	self appendColumn: (GtkTreeViewColumn new
		packStart: renderer expand: false;
		addAttribute: 'pixbuf' column: columnIndex renderer: renderer)
]

{ #category : #'convenience columns' }
GtkTreeView >> appendTextColumn [

	self appendTextColumn: 0
]

{ #category : #'convenience columns' }
GtkTreeView >> appendTextColumn: columnIndex [
	| renderer |

	renderer := GtkCellRendererText new.
	self appendColumn: (GtkTreeViewColumn new
		packStart: renderer;
		addAttribute: 'text' column: columnIndex renderer: renderer)
]

{ #category : #private }
GtkTreeView >> basicAppendColumn: column [

	self ffiCall: #(gint gtk_tree_view_append_column (self, GtkTreeViewColumn *column))
]

{ #category : #private }
GtkTreeView >> basicRemoveColumn: column [ 
	
	self ffiCall: #(gint gtk_tree_view_remove_column (self, GtkTreeViewColumn *column))
]

{ #category : #configuring }
GtkTreeView >> beMultipleSelectionMode [
	self selection mode: GtkSelectionMode GTK_SELECTION_MULTIPLE
]

{ #category : #configuring }
GtkTreeView >> beSingleSelectionMode [
	self selection mode: GtkSelectionMode GTK_SELECTION_SINGLE
]

{ #category : #columns }
GtkTreeView >> columns [
	^ columns
]

{ #category : #events }
GtkTreeView >> connectRowActivated: aBlock [ 
	
	^ (GRowActivatedCallback do: aBlock) connectTo: self
]

{ #category : #signals }
GtkTreeView >> connectRowExpanded: aBlock [

	self 
		connect: 'row-expanded' 
		signature: #(void (void *treeView, void *iter, void *path, void *userData))
		do: [ :treeView :iterHandle :pathHandle :userData | | iter path |
			iter := (GtkTreeIter fromHandle: iterHandle) copyInMemory.
			path := (GtkTreePath fromHandle: pathHandle) toArray.
			aBlock cull: iter cull: path  ]
]

{ #category : #signals }
GtkTreeView >> connectSelectionChanged: aBlock [

	^ self selection connectChanged: aBlock
]

{ #category : #signals }
GtkTreeView >> connectTestExpandRow: aBlock [
	"You need to answer false to allow expansion (yes, this is weird)"

	self 
		connect: 'test-expand-row' 
		signature: #(gboolean (void *treeView, void *iter, void *path, void *userData))
		do: [ :treeView :iterHandle :pathHandle :userData | | iter path |
			iter := (GtkTreeIter fromHandle: iterHandle) copyInMemory.
			path := (GtkTreePath fromHandle: pathHandle) toArray.
			aBlock cull: iter cull: path ]
]

{ #category : #private }
GtkTreeView >> doExpandToPath: path [ 
	
	self ffiCall: #(void gtk_tree_view_expand_to_path (self, GtkTreePath *path))
]

{ #category : #accessing }
GtkTreeView >> enableSearch: enable_search [

	self ffiCall: #(void gtk_tree_view_set_enable_search (self, gboolean enable_search))
]

{ #category : #private }
GtkTreeView >> enableTreeLines [

	self enableTreeLines: true
]

{ #category : #private }
GtkTreeView >> enableTreeLines: enabled [

	self ffiCall: #(void gtk_tree_view_set_enable_tree_lines (self,
                                     gboolean enabled))
]

{ #category : #expanding }
GtkTreeView >> expandToPath: pathArray [

	self doExpandToPath: (GtkTreePath newFromArray: pathArray) autoRelease 
]

{ #category : #accessing }
GtkTreeView >> fixedHeightMode: enable [

	^ self ffiCall: #(void gtk_tree_view_set_fixed_height_mode (self, gboolean enable))
]

{ #category : #private }
GtkTreeView >> getModel [

	^ self ffiCall: #(GtkListStore gtk_tree_view_get_model (self))
]

{ #category : #private }
GtkTreeView >> getSelection [ 

	^ self ffiCall: #(GtkTreeSelection *gtk_tree_view_get_selection (self))
]

{ #category : #accessing }
GtkTreeView >> headersVisible: aBoolean [

	self gObjectSet: 'headers-visible' toBoolean: aBoolean
]

{ #category : #accessing }
GtkTreeView >> hoverExpand: expand [

	self ffiCall: #(void gtk_tree_view_set_hover_expand (self, gboolean expand))
]

{ #category : #initialization }
GtkTreeView >> initialize [

	super initialize.
	self fixedHeightMode: true.
	columns := OrderedCollection new: 1
]

{ #category : #testing }
GtkTreeView >> isActivateOnSingleClick [
	
	^ self ffiCall: #(gboolean gtk_tree_view_get_activate_on_single_click (self))
]

{ #category : #testing }
GtkTreeView >> isEnableSearch [

	^ self ffiCall: #(gboolean gtk_tree_view_get_enable_search (self))
]

{ #category : #testing }
GtkTreeView >> isFixedHeightMode [

	^ self ffiCall: #(gboolean gtk_tree_view_get_fixed_height_mode (self))
]

{ #category : #testing }
GtkTreeView >> isHeadersVisible [
	| buffer |
	
	buffer := ByteArray new: Smalltalk wordSize.
	buffer pinInMemory.
	self gObjectGet: 'headers-visible' into: buffer.
	^ buffer booleanAt: 1
]

{ #category : #testing }
GtkTreeView >> isHoverExpand [ 

	^ self ffiCall: #(gboolean gtk_tree_view_get_hover_expand (self))
]

{ #category : #accessing }
GtkTreeView >> model [

	^ listStore ifNil: [ 
		listStore := self getModel 
			objectRef;
			yourself ]
]

{ #category : #accessing }
GtkTreeView >> model: aListStore [

	listStore ifNotNil: [ listStore objectUnref ].
	listStore := aListStore.
	listStore objectRef.
	
	self setModel: aListStore
]

{ #category : #columns }
GtkTreeView >> newColumn [

	| column |
	column := GtkTreeViewColumn new.
	self appendColumn: column.
	^ column
]

{ #category : #columns }
GtkTreeView >> removeAllColumns [
	
	columns copy do: [ :aColumn | self removeColumn: aColumn ]
]

{ #category : #columns }
GtkTreeView >> removeColumn: aGtkTreeViewColumn [ 
	
	columns remove: aGtkTreeViewColumn.
	self basicRemoveColumn: aGtkTreeViewColumn
]

{ #category : #private }
GtkTreeView >> scrollToCellPath: path column: column useAlign: use_align rowAlign: row_align colAlign: col_align [

	self ffiCall: #(void gtk_tree_view_scroll_to_cell (
		self,
		GtkTreePath *path,
		GtkTreeViewColumn *column,
		gboolean use_align,
		gfloat row_align,
		gfloat col_align))
]

{ #category : #accessing }
GtkTreeView >> scrollToPath: path [
	
	self 
		scrollToPath: (GtkTreePath newFromArray: path) autoRelease
		useAlign: true 
		rowAlign: 1.0 
		colAlign: 0.0
]

{ #category : #private }
GtkTreeView >> scrollToPath: path useAlign: use_align rowAlign: row_align colAlign: col_align [

	self ffiCall: #(void gtk_tree_view_scroll_to_cell (
		self,
		GtkTreePath *path,
		NULL,
		gboolean use_align,
		gfloat row_align,
		gfloat col_align))
]

{ #category : #selection }
GtkTreeView >> selectIndex: anInteger [ 
	
	self selection selectPath: { anInteger }
]

{ #category : #accessing }
GtkTreeView >> selectPath: pathArray [ 

	self selection selectPath: pathArray
]

{ #category : #accessing }
GtkTreeView >> selected [

	^ self allSelected ifNotEmpty: #first
]

{ #category : #selection }
GtkTreeView >> selectedIndexes [

	^ self selection allSelected flattened
]

{ #category : #private }
GtkTreeView >> selection [ 

	^ selection ifNil: [ selection := self getSelection initialize ]
]

{ #category : #private }
GtkTreeView >> setExpanderColumn: aColumn [

	self ffiCall: #(void gtk_tree_view_set_expander_column(self, GtkTreeViewColumn *aColumn))
]

{ #category : #private }
GtkTreeView >> setModel: aListStore [

	^ self ffiCall: #(void gtk_tree_view_set_model (self, GtkTreeStore *aListStore))
]
