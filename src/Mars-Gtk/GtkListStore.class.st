"
GtkListStore
GtkListStore — A list-like data structure that can be used with the GtkTreeView

https://developer.gnome.org/gtk3/stable/GtkListStore.html#gtk-list-store-new
"
Class {
	#name : #GtkListStore,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-List'
}

{ #category : #accessing }
GtkListStore class >> gtkListStoreNewWithNumberOfColums: numberoOfColumns andTypes: types [

	^ self ffiCall: #(GtkListStore * gtk_list_store_newv (gint numberoOfColumns, void *types))
]

{ #category : #accessing }
GtkListStore class >> newWithColumnTypes: columnTypes [
	| columnTypesExternalArray |
	columnTypesExternalArray := ExternalAddress allocate: columnTypes size * FFIArchitecture forCurrentArchitecture longTypeSize.
	columnTypes
		withIndexDo: [ :value :index | columnTypesExternalArray platformUnsignedLongAt: 1 + ((index - 1) * FFIArchitecture forCurrentArchitecture longTypeSize) put: value ].
	^ (self gtkListStoreNewWithNumberOfColums: columnTypes size andTypes: columnTypesExternalArray) initialize
]

{ #category : #iterating }
GtkListStore >> appendRow [

	| iterator |
	iterator := GtkListIter externalNew autoRelease.
	iterator store: self.
	self gtkListStoreAppend: iterator.
	^ iterator
]

{ #category : #private }
GtkListStore >> gtkListStoreAppend: anIterator [

	^ self ffiCall: #(void gtk_list_store_append (self, GtkListIter* anIterator))
]
