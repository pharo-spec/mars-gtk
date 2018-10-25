Class {
	#name : #GtkTreePath,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #'instance creation' }
GtkTreePath class >> new [

	^ self treePathNew initialize
]

{ #category : #private }
GtkTreePath class >> treePathNew [

	^ self ffiCall: #(GtkTreePath *gtk_tree_path_new (void))
]

{ #category : #converting }
GtkTreePath >> toArray [

	^ (self toString substrings: ':')
		collect: [ :each | each asNumber + 1 ]
]

{ #category : #converting }
GtkTreePath >> toString [ 

	^ self ffiCall: #(gchar *gtk_tree_path_to_string (self))
]
