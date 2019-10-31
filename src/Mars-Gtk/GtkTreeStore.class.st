"
GtkTreeStore
GtkTreeStore — A tree-like data structure that can be used with the GtkTreeView

https://developer.gnome.org/gtk3/stable/GtkTreeStore.html
"
Class {
	#name : #GtkTreeStore,
	#superclass : #GtkBaseStore,
	#traits : 'GtkTreeSortable',
	#classTraits : 'GtkTreeSortable classTrait',
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

{ #category : #accessing }
GtkTreeStore class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_tree_store_get_type())
]

{ #category : #private }
GtkTreeStore class >> gtkTreeStoreNewWithNumberOfColums: numberoOfColumns andTypes: types [

	^ self ffiCall: #(GtkTreeStore * gtk_tree_store_newv (gint numberoOfColumns, oop types))
]

{ #category : #iterating }
GtkTreeStore >> appendNew [
	
	^ (GtkTreeIter on: self) appendNewRoot
]

{ #category : #testing }
GtkTreeStore >> numberOfColumns [

	^ self ffiCall: #(gint gtk_tree_model_get_n_columns(self))
]

{ #category : #private }
GtkTreeStore >> setSortFunc: sort_func columnId: sort_column_id [

	self ffiCall: #(void gtk_tree_sortable_set_sort_func (
		self,
		gint sort_column_id,
		GCallback sort_func,
		NULL,
		NULL))
]

{ #category : #sorting }
GtkTreeStore >> sortBy: aBlock columnId: id [

	self 
		sortFunc: (GCallback 
			signature: #(gint (void *model, void *a, void *b, gpointer user_data))  
			block: [ :model :a :b :user_data |
				aBlock 
					value: (GtkTreeIter fromHandle: a)
					value: (GtkTreeIter fromHandle: b) ] )
		columnId: id
]
