Class {
	#name : #GtkTreePath,
	#superclass : #GBaseObject,
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #finalization }
GtkTreePath class >> finalizeResourceData: handle [
	"when marking for autoRelease, g-objects needs to be freed in a particular way."

	handle isNull ifTrue: [ ^ self ].
	self treePathFree: handle.
	handle beNull
]

{ #category : #finalization }
GtkTreePath class >> fromHandle: aHandle [

	^ self basicNew setHandle: aHandle
]

{ #category : #'instance creation' }
GtkTreePath class >> new [

	^ self treePathNew initialize
]

{ #category : #'instance creation' }
GtkTreePath class >> newFromArray: anArray [

	"Gtk3 is zero based :("
	^ self newFromString: ((anArray collect: [ :each | each - 1]) joinUsing: $:)
]

{ #category : #private }
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

{ #category : #private }
GtkTreePath >> basicFree [

	self ffiCall: #(void gtk_tree_path_free (self))
]

{ #category : #copying }
GtkTreePath >> copy [ 

	^ self ffiCall: #(GtkTreePath *gtk_tree_path_copy (self))
]

{ #category : #private }
GtkTreePath >> down [ 

	^ self ffiCall: #(void gtk_tree_path_down (self))
]

{ #category : #accessing }
GtkTreePath >> firstChild [
	| path |

	path := self copy autoRelease.
	path down.
	^ path
]

{ #category : #'initialize-release' }
GtkTreePath >> free [

	self basicFree.
	handle beNull
]

{ #category : #accessing }
GtkTreePath >> moveNext [

	^ self ffiCall: #(void gtk_tree_path_next (self))
]

{ #category : #accessing }
GtkTreePath >> movePrev [

	^ self ffiCall: #(gboolean gtk_tree_path_prev (self))
]

{ #category : #accessing }
GtkTreePath >> parent [
	| path |

	path := self copy autoRelease. 
	path up.
	^ path
]

{ #category : #converting }
GtkTreePath >> toArray [

	^ (self toString substrings: ':')
		collect: [ :each | each asNumber + 1 ]
]

{ #category : #private }
GtkTreePath >> toString [ 

	^ self ffiCall: #(gchar *gtk_tree_path_to_string (self))
]

{ #category : #private }
GtkTreePath >> up [ 

	^ self ffiCall: #(void gtk_tree_path_up (self))
]
