"
GtkTreeSelection — The selection object for GtkTreeView

https://developer.gnome.org/gtk3/stable/GtkTreeSelection.html
"
Class {
	#name : #GtkTreeSelection,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #accessing }
GtkTreeSelection class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_tree_selection_get_type())
]

{ #category : #accessing }
GtkTreeSelection >> allSelected [
	| list next |
	
	^ Array streamContents: [ :stream |
		list := self getSelectedRows.
		next := list.
		[ next isNull ] whileFalse: [ 
		 	stream nextPut: (GtkTreePath fromHandle: next data) toArray.
			next := next next ]. 
		list freeFull ]
]

{ #category : #private }
GtkTreeSelection >> basicSelectPath: path [

	self ffiCall: #(void gtk_tree_selection_select_path (self, GtkTreePath *path))
]

{ #category : #private }
GtkTreeSelection >> basicUnselectPath: path [

	self ffiCall: #(void gtk_tree_selection_unselect_path (self, GtkTreePath *path))
]

{ #category : #signals }
GtkTreeSelection >> connectChanged: aBlock [

	(GChangedCallback do: aBlock) connectTo: self
]

{ #category : #private }
GtkTreeSelection >> getSelectedRows [

	^ self ffiCall: #(GList *gtk_tree_selection_get_selected_rows (self, NULL))
]

{ #category : #testing }
GtkTreeSelection >> isSelected: pathArray [

	^ self allSelected includes: pathArray
]

{ #category : #accessing }
GtkTreeSelection >> mode [
	
	self ffiCall: #(GtkSelectionMode gtk_tree_selection_get_mode (self))
]

{ #category : #'selection mode' }
GtkTreeSelection >> mode: type [
	
	self ffiCall: #(void gtk_tree_selection_set_mode (self, GtkSelectionMode type))
]

{ #category : #accessing }
GtkTreeSelection >> selectPath: pathArray [
	"an array to the path selected: #(1 2 3)"
	| path |
	
	"if is already selected, skip"
	(self allSelected includes: pathArray) ifTrue: [ ^ self ].
	
	path := (GtkTreePath newFromArray: pathArray) autoRelease.
	self basicSelectPath: path
]

{ #category : #private }
GtkTreeSelection >> selectedForEach: func data: data [

	self ffiCall: #(void gtk_tree_selection_selected_foreach (
		self,
		GCallback func,
		gpointer data))
]

{ #category : #accessing }
GtkTreeSelection >> selectedPath [
	
	| allSelected |
	allSelected := self allSelected.
	allSelected size > 1 ifTrue: [ self error: 'Not single selection' ].
	
	allSelected size = 0 ifTrue: [ ^ nil ].
	^ allSelected first
]

{ #category : #selection }
GtkTreeSelection >> unselectAll [
	
	self ffiCall: #(void gtk_tree_selection_unselect_all (self))
]

{ #category : #accessing }
GtkTreeSelection >> unselectPath: pathArray [

	| path |
	
	"if is none selected, skip"
	(self allSelected includes: pathArray) ifFalse: [ ^ self ].
	
	path := (GtkTreePath newFromArray: pathArray) autoRelease.
	self basicUnselectPath: path
]
