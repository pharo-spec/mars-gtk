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

{ #category : #accessing }
GtkTreePath >> appendIndex: index [

	^ self ffiCall: #(void gtk_tree_path_append_index (self, gint index))
]

{ #category : #private }
GtkTreePath >> basicFree [

	self ffiCall: #(void gtk_tree_path_free (self))
]

{ #category : #copying }
GtkTreePath >> copy [ 

	^ self ffiCall: #(GtkTreePath *gtk_tree_path_copy (self))
]

{ #category : #accessing }
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

{ #category : #initialization }
GtkTreePath >> free [

	self basicFree.
	handle beNull
]

{ #category : #private }
GtkTreePath >> getIndicesWithDepth: depth [

	^ self ffiCall: #(gint *gtk_tree_path_get_indices_with_depth (self, gint *depth))
]

{ #category : #accessing }
GtkTreePath >> next [

	^ self ffiCall: #(void gtk_tree_path_next (self))
]

{ #category : #accessing }
GtkTreePath >> parent [
	| path |

	path := self copy autoRelease. 
	path up.
	^ path
]

{ #category : #accessing }
GtkTreePath >> prev [

	^ self ffiCall: #(gboolean gtk_tree_path_prev (self))
]

{ #category : #converting }
GtkTreePath >> toArray [
	| indices depth |
	
	depth := FFIInt32 newBuffer.
	indices := self getIndicesWithDepth: depth.
	^ Array streamContents: [ :stream |
		1 to: (depth signedLongAt: 1) do: [ :index |
			stream nextPut: (indices signedLongAt: (((index - 1) * FFIInt32 externalTypeSize) + 1)) + 1 ] ].
]

{ #category : #private }
GtkTreePath >> toString [ 

	^ self ffiCall: #(gchar *gtk_tree_path_to_string (self))
]

{ #category : #accessing }
GtkTreePath >> up [ 

	^ self ffiCall: #(gboolean gtk_tree_path_up (self))
]
