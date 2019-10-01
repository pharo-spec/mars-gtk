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
GtkListStore class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_list_store_get_type())
]

{ #category : #accessing }
GtkListStore class >> gtkListStoreNewWithNumberOfColums: numberoOfColumns andTypes: types [

	^ self ffiCall: #(GtkListStore *gtk_list_store_newv (gint numberoOfColumns, void *types))
]

{ #category : #iterating }
GtkListStore >> appendNew [
	
	^ (GtkListIter on: self) appendNew
]
