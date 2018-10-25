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
	function := FFICallback 
		signature: #(void (void *model, void *path, void *iter, void *data)) 
		block: [ :model :path :iter :data |
			paths add: (GtkTreePath fromHandle: path) toArray ].
		
	self selectedForEach: function data: ExternalAddress null.
	
	^ paths
]

{ #category : #signals }
GtkTreeSelection >> connectChanged: aBlock [

	self connect: 'changed' do: aBlock
]

{ #category : #private }
GtkTreeSelection >> selectedForEach: func data: data [

	self ffiCall: #(void gtk_tree_selection_selected_foreach (
		self,
		FFICallback func,
		gpointer data))
]
