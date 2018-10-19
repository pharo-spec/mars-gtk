"
GtkTreeStore
GtkTreeStore — A tree-like data structure that can be used with the GtkTreeView

https://developer.gnome.org/gtk3/stable/GtkTreeStore.html
"
Class {
	#name : #GtkTreeStore,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #accessing }
GtkTreeStore class >> gtkTreeStoreNewWithNumberOfColums: numberoOfColumns andTypes: types [

	^ self ffiCall: #(GtkTreeStore * gtk_tree_store_newv (gint numberoOfColumns, void *types))
]

{ #category : #accessing }
GtkTreeStore class >> newWithColumnTypes: columnTypes [
	| columnTypesExternalArray |
	columnTypesExternalArray := ExternalAddress allocate: columnTypes size * FFIArchitecture forCurrentArchitecture longTypeSize.
	columnTypes
		withIndexDo: [ :value :index | columnTypesExternalArray platformUnsignedLongAt: 1 + ((index - 1) * FFIArchitecture forCurrentArchitecture longTypeSize) put: value ].
	^ (self gtkTreeStoreNewWithNumberOfColums: columnTypes size andTypes: columnTypesExternalArray) initialize
]

{ #category : #iterating }
GtkTreeStore >> appendChildInParent: aParent [

	| iterator |
	iterator := GtkTreeIter externalNew autoRelease.
	iterator store: self.
	self gtkTreeStoreAppend: iterator withParent: aParent.
	^ iterator
]

{ #category : #iterating }
GtkTreeStore >> appendRow [

	^ self appendChildInParent: nil
]

{ #category : #private }
GtkTreeStore >> gtkTreeStoreAppend: anIterator withParent: aParentIterator [

	^ self ffiCall: #(void gtk_tree_store_append (self, GtkTreeIter *anIterator, GtkTreeIter *aParentIterator))
]
