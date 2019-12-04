"
A function used for checking whether a row in model matches a search key string entered by the user. Note the return value is reversed from what you would normally expect, though it has some similarity to strcmp() returning 0 for equal strings.

https://developer.gnome.org/gtk3/stable/GtkTreeView.html#GtkTreeViewSearchEqualFunc
"
Class {
	#name : #GtkTreeViewSearchEqualFunc,
	#superclass : #GCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #enumerating }
GtkTreeViewSearchEqualFunc class >> do: aBlock [

	^ self 
		signature: #(gboolean (
			void *model, 
			gint column, 
			const gchar *key, 
			void *iter, 
			gpointer search_data))
		block: [ :model :column :key :iter :search_data | | result |
			result := aBlock
				value: key 
				value: column 
				value: (GtkTreeIter fromHandle: iter).
			(result == true) not ]
]
