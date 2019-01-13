"
GtkListStore
GtkListStore — A list-like data structure that can be used with the GtkTreeView

https://developer.gnome.org/gtk3/stable/GtkListStore.html#gtk-list-store-new
"
Class {
	#name : #GtkListStore,
	#superclass : #GtkBaseStore,
	#category : #'Mars-Gtk-Widget-List'
}

{ #category : #private }
GtkListStore class >> basicNewWithNumberOfColumns: aNumber andTypes: anExternalArray [

	^ self 
		gtkListStoreNewWithNumberOfColums: aNumber 
		andTypes: anExternalArray
]

{ #category : #accessing }
GtkListStore class >> gtkListStoreNewWithNumberOfColums: numberoOfColumns andTypes: types [

	^ self ffiCall: #(GtkListStore *gtk_list_store_newv (gint numberoOfColumns, void *types))
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

{ #category : #initialization }
GtkListStore >> initialize [ 
	super initialize.
	"self autoRelease"
]
