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
GtkTreeSelection >> allSelected [
	| function paths |
	
	paths := OrderedCollection new.
	function := GCallback 
		signature: #(void (void *model, void *path, void *iter, void *data)) 
		block: [ :model :path :iter :data |
			paths add: (GtkTreePath fromHandle: path) toArray ].
		
	self selectedForEach: function data: ExternalAddress null.
	
	^ paths
]

{ #category : #private }
GtkTreeSelection >> basicSelectPath: path [

	self ffiCall: #(void gtk_tree_selection_select_path (self, GtkTreePath *path))
]

{ #category : #signals }
GtkTreeSelection >> connectChanged: aBlock [

	self connect: 'changed' do: aBlock
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
