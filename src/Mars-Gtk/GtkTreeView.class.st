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

{ #category : #'instance creation' }
GtkTreeView class >> new [

	^ self treeViewNew initialize
]

{ #category : #private }
GtkTreeView class >> treeViewNew [

	^ self ffiCall: #(#GtkTreeView *gtk_tree_view_new (void))
]

{ #category : #accessing }
GtkTreeView >> activateOnSingleClick: aBoolean [

	self gObjectSet: 'activate-on-single-click' toBoolean: aBoolean
]

{ #category : #private }
GtkTreeView >> addExpanderColumn [

	self ffiCall: #(void gtk_tree_view_set_expander_column(self, 0))
]

{ #category : #accessing }
GtkTreeView >> allSelected [ 

	^ self selection allSelected 
]

{ #category : #accessing }
GtkTreeView >> appendColumn: column [
	
	columns add: column.
	self basicAppendColumn: column
]

{ #category : #'convenience columns' }
GtkTreeView >> appendTextColumn [
	| renderer |

	renderer := GtkCellRendererText new.
	self appendColumn: (GtkTreeViewColumn new
		packStart: renderer;
		addAttribute: 'text' column: 0 renderer: renderer)
]

{ #category : #private }
GtkTreeView >> basicAppendColumn: column [

	self ffiCall: #(gint gtk_tree_view_append_column (self, GtkTreeViewColumn *column))
]

{ #category : #configuring }
GtkTreeView >> beSingleSelectionMode [
	self selection mode: GtkSelectionMode GTK_SELECTION_SINGLE
]

{ #category : #signals }
GtkTreeView >> connectRowExpanded: aBlock [

	self 
		connect: 'row-expanded' 
		signature: #(void (void *treeView, void *iter, void *path, void *userData))
		do: [ :treeView :iterHandle :pathHandle :userData | | iter path |
			iter := (GtkTreeIter fromHandle: iterHandle) copyInMemory.
			path := (GtkTreePath fromHandle: pathHandle) toArray.
			[ aBlock cull: iter cull: path ] fork ]
]

{ #category : #signals }
GtkTreeView >> connectRowSelected: aBlock [

	self 
		connect: 'row-activated' 
		signature: #(void (void *treeView, void *path, void *column, void *userData))
		do: [ :treeView :path :column :userData | 
			| indexPath |
			self flag: #TODO. "This is temporal (I hope if does not lasts until future me finds 
			this five years from now ;). 
			The fact is that Gtk3 is destroying the path after using it... and I do not want to 
			process this inside the callback (I want to fork it) so I need to take the values 
			now."
			indexPath := (GtkTreePath fromHandle: path) toArray.
			[ aBlock value: indexPath ] fork ]
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
GtkTreeView >> enableTreeLines [

	self enableTreeLines: true
]

{ #category : #private }
GtkTreeView >> enableTreeLines: enabled [

	self ffiCall: #(void gtk_tree_view_set_enable_tree_lines (self,
                                     gboolean enabled))
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

{ #category : #initialization }
GtkTreeView >> initialize [

	super initialize.
	columns := OrderedCollection new: 1
]

{ #category : #testing }
GtkTreeView >> isActivateOnSingleClick [
	| buffer |
	
	buffer := FFIBool newBuffer.
	self gObjectGet: 'activate-on-single-click' into: buffer.
	^ buffer booleanAt: 1
]

{ #category : #testing }
GtkTreeView >> isHeadersVisible [
	| buffer |
	
	buffer := FFIBool newBuffer.
	self gObjectGet: 'headers-visible' into: buffer.
	^ buffer booleanAt: 1
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

{ #category : #accessing }
GtkTreeView >> newColumn [

	| column |
	column := GtkTreeViewColumn new.
	self appendColumn: column.
	^ column
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
