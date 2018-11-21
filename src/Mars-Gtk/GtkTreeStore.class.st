"
GtkTreeStore
GtkTreeStore — A tree-like data structure that can be used with the GtkTreeView

https://developer.gnome.org/gtk3/stable/GtkTreeStore.html
"
Class {
	#name : #GtkTreeStore,
	#superclass : #GObject,
	#pools : [
		'GType'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #private }
GtkTreeStore class >> gtkTreeStoreNewWithNumberOfColums: numberoOfColumns andTypes: types [

	^ self ffiCall: #(GtkTreeStore * gtk_tree_store_newv (gint numberoOfColumns, void *types))
]

{ #category : #'instance creation' }
GtkTreeStore class >> newColumnTypes: columnTypes [
	| columnTypesExternalArray longSize |
	
	longSize := FFIArchitecture forCurrentArchitecture longTypeSize.
	columnTypesExternalArray := ByteArray new: columnTypes size * longSize.
	
	columnTypes withIndexDo: [ :value :index | 
		columnTypesExternalArray 
			platformUnsignedLongAt: 1 + ((index - 1) * longSize) 
			put: value ].
		
	^ (self gtkTreeStoreNewWithNumberOfColums: columnTypes size andTypes: columnTypesExternalArray) initialize
]

{ #category : #'instance creation' }
GtkTreeStore class >> newStrings: aCollection [
	"convenience method to create a store of strings"
	| store |
	
	store := self newColumnTypes: { G_TYPE_STRING }.
	aCollection do: [ :each |
		store appendRow
			at: 0 
			putString: each utf8Encoded asString ].

	^ store
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

{ #category : #initialization }
GtkTreeStore >> initialize [ 

	super initialize.
	"Stores need to be unreferenced after set"
	self autoRelease
]
