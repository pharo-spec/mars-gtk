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
		'selection'
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
	
	self ffiCall: #(gint gtk_tree_view_append_column (self, GtkTreeViewColumn *column))
]

{ #category : #'convenience columns' }
GtkTreeView >> appendTextColumn [
	| renderer |

	renderer := GtkCellRendererText new.
	self appendColumn: (GtkTreeViewColumn new
		renderer: renderer;
		setAttribute: 'text' toColumAtIndex: 0 forRenderer: renderer)
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
GtkTreeView >> getSelection [ 

	^ self ffiCall: #(GtkTreeSelection *gtk_tree_view_get_selection (self))
]

{ #category : #accessing }
GtkTreeView >> headersVisible: aBoolean [

	self gObjectSet: 'headers-visible' toBoolean: aBoolean
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

	^ self ffiCall: #(GtkListStore gtk_tree_view_get_model (self))
]

{ #category : #accessing }
GtkTreeView >> model: aListStore [

	listStore := aListStore.
	self setModel: aListStore
]

{ #category : #accessing }
GtkTreeView >> newColumn [

	| column |
	column := GtkTreeViewColumn new.
	self appendColumn: column.
	^ column
]

{ #category : #accessing }
GtkTreeView >> selectPath: pathArray [ 

	self selection selectPath: pathArray
]

{ #category : #accessing }
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
