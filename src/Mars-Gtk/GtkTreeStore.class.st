"
GtkTreeStore
GtkTreeStore — A tree-like data structure that can be used with the GtkTreeView

https://developer.gnome.org/gtk3/stable/GtkTreeStore.html
"
Class {
	#name : #GtkTreeStore,
	#superclass : #GtkBaseStore,
	#pools : [
		'GType'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #private }
GtkTreeStore class >> basicNewWithNumberOfColumns: aNumber andTypes: anExternalArray [

	^ self 
		gtkTreeStoreNewWithNumberOfColums: aNumber 
		andTypes: anExternalArray
]

{ #category : #private }
GtkTreeStore class >> gtkTreeStoreNewWithNumberOfColums: numberoOfColumns andTypes: types [

	^ self ffiCall: #(GtkTreeStore * gtk_tree_store_newv (gint numberoOfColumns, void *types))
]

{ #category : #iterating }
GtkTreeStore >> appendNew [
	
	^ (GtkTreeIter on: self) appendNewRoot
]

{ #category : #initialization }
GtkTreeStore >> initialize [ 

	"super initialize."
	"Stores need to be unreferenced after set"
	self autoRelease
]
