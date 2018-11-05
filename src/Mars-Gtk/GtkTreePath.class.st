Class {
	#name : #GtkTreePath,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #finalization }
GtkTreePath class >> finalizeResourceData: handle [
	"when marking for autoRelease, g-objects needs to be freed in a particular way."

	handle isNull ifTrue: [ ^ self ].
	self treePathFree: handle.
	handle beNull
]

{ #category : #'instance creation' }
GtkTreePath class >> new [

	^ self treePathNew initialize
]

{ #category : #'instance creation' }
GtkTreePath class >> newFromString: aString [

	^ (self treePathNewFromString: aString) initialize
	
]

{ #category : #private }
GtkTreePath class >> treePathFree: path [

	^ self ffiCall: #(void gtk_tree_path_free (void *path))
]

{ #category : #private }
GtkTreePath class >> treePathNew [

	^ self ffiCall: #(GtkTreePath *gtk_tree_path_new (void))
]

{ #category : #private }
GtkTreePath class >> treePathNewFromString: path [

	^ self ffiCall: #(GtkTreePath *gtk_tree_path_new_from_string (const gchar *path))
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
