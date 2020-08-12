Class {
	#name : #GtkTreeModelIface,
	#superclass : #GInterface,
	#instVars : [
		'get_flags',
		'get_iter',
		'get_n_columns',
		'get_path',
		'get_value',
		'iter_children',
		'iter_has_child',
		'iter_n_children',
		'iter_next',
		'iter_nth_child',
		'iter_parent',
		'iter_previous',
		'ref_node',
		'row_changed',
		'row_deleted',
		'row_has_child_toggled',
		'row_inserted',
		'rows_reordered',
		'unref_node',
		'get_column_type'
	],
	#classVars : [
		'OFFSET_GET_COLUMN_TYPE',
		'OFFSET_GET_FLAGS',
		'OFFSET_GET_ITER',
		'OFFSET_GET_N_COLUMNS',
		'OFFSET_GET_PATH',
		'OFFSET_GET_VALUE',
		'OFFSET_ITER_CHILDREN',
		'OFFSET_ITER_HAS_CHILD',
		'OFFSET_ITER_NEXT',
		'OFFSET_ITER_NTH_CHILD',
		'OFFSET_ITER_N_CHILDREN',
		'OFFSET_ITER_PARENT',
		'OFFSET_ITER_PREVIOUS',
		'OFFSET_REF_NODE',
		'OFFSET_ROWS_REORDERED',
		'OFFSET_ROW_CHANGED',
		'OFFSET_ROW_DELETED',
		'OFFSET_ROW_HAS_CHILD_TOGGLED',
		'OFFSET_ROW_INSERTED',
		'OFFSET_UNREF_NODE'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #'field definition' }
GtkTreeModelIface class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ super fieldsDesc, #(
	"/*< public >*/"
	"/* Signals */"
	GCallback row_changed;
	GCallback row_inserted;
	GCallback row_has_child_toggled;
	GCallback row_deleted;
	GCallback rows_reordered;
	"/* Virtual Table */"
	GCallback get_flags;
	GCallback get_n_columns;
	GCallback get_column_type;
	GCallback get_iter;
	GCallback get_path;
	GCallback get_value;
	GCallback iter_next;
	GCallback iter_previous;
	GCallback iter_children;
	GCallback iter_has_child;
	GCallback iter_n_children;
	GCallback iter_nth_child;
	GCallback iter_parent;
	GCallback ref_node;
	GCallback unref_node
)
]

{ #category : #accessing }
GtkTreeModelIface class >> gType [ 
	"This method was automatically generated"

	^ self 
		ffiCall: #(gsize gtk_tree_model_get_type())
		module: GtkLibrary
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_column_type [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_COLUMN_TYPE) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_column_type: anObject [
	"This method was automatically generated"
	
	get_column_type := anObject.
	handle 
		pointerAt: OFFSET_GET_COLUMN_TYPE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_flags [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_FLAGS) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_flags: anObject [
	"This method was automatically generated"
	get_flags := anObject.
	handle 
		pointerAt: OFFSET_GET_FLAGS
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_iter [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ITER) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_iter: anObject [
	"This method was automatically generated"
	get_iter := anObject.
	handle 
		pointerAt: OFFSET_GET_ITER
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_n_columns [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_N_COLUMNS) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_n_columns: anObject [
	"This method was automatically generated"
	get_n_columns := anObject.
	handle 
		pointerAt: OFFSET_GET_N_COLUMNS
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_path [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_PATH) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_path: anObject [
	"This method was automatically generated"
	
	get_path := anObject.
	handle 
		pointerAt: OFFSET_GET_PATH
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_value [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_VALUE) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> get_value: anObject [
	"This method was automatically generated"
	
	get_value := anObject.
	handle 
		pointerAt: OFFSET_GET_VALUE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_children [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ITER_CHILDREN) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_children: anObject [
	"This method was automatically generated"
	
	iter_children := anObject.
	handle 
		pointerAt: OFFSET_ITER_CHILDREN
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_has_child [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ITER_HAS_CHILD) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_has_child: anObject [
	"This method was automatically generated"
	
	iter_has_child := anObject.
	handle 
		pointerAt: OFFSET_ITER_HAS_CHILD
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_n_children [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ITER_N_CHILDREN) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_n_children: anObject [
	"This method was automatically generated"
	
	iter_n_children := anObject.
	handle 
		pointerAt: OFFSET_ITER_N_CHILDREN
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_next [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ITER_NEXT) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_next: anObject [
	"This method was automatically generated"
	
	iter_next := anObject.
	handle 
		pointerAt: OFFSET_ITER_NEXT
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_nth_child [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ITER_NTH_CHILD) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_nth_child: anObject [
	"This method was automatically generated"
	
	iter_nth_child := anObject.
	handle 
		pointerAt: OFFSET_ITER_NTH_CHILD
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_parent [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ITER_PARENT) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_parent: anObject [
	"This method was automatically generated"
	
	iter_parent := anObject.
	handle 
		pointerAt: OFFSET_ITER_PARENT
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_previous [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ITER_PREVIOUS) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> iter_previous: anObject [
	"This method was automatically generated"
	
	iter_previous := anObject.
	handle 
		pointerAt: OFFSET_ITER_PREVIOUS
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> ref_node [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_REF_NODE) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> ref_node: anObject [
	"This method was automatically generated"
	
	ref_node := anObject.
	handle 
		pointerAt: OFFSET_REF_NODE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> row_changed [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ROW_CHANGED) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> row_changed: anObject [
	"This method was automatically generated"
	
	row_changed := anObject.
	handle 
		pointerAt: OFFSET_ROW_CHANGED
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> row_deleted [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ROW_DELETED) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> row_deleted: anObject [
	"This method was automatically generated"
	
	row_deleted := anObject.
	handle 
		pointerAt: OFFSET_ROW_DELETED
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> row_has_child_toggled [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ROW_HAS_CHILD_TOGGLED) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> row_has_child_toggled: anObject [
	"This method was automatically generated"
	
	row_has_child_toggled := anObject.
	handle 
		pointerAt: OFFSET_ROW_HAS_CHILD_TOGGLED
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> row_inserted [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ROW_INSERTED) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> row_inserted: anObject [
	"This method was automatically generated"
	
	row_inserted := anObject.
	handle 
		pointerAt: OFFSET_ROW_INSERTED
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> rows_reordered [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ROWS_REORDERED) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> rows_reordered: anObject [
	"This method was automatically generated"
	
	rows_reordered := anObject.
	handle 
		pointerAt: OFFSET_ROWS_REORDERED
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> unref_node [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_UNREF_NODE) asInteger)
]

{ #category : #'accessing structure variables' }
GtkTreeModelIface >> unref_node: anObject [
	"This method was automatically generated"
	
	unref_node := anObject.
	handle 
		pointerAt: OFFSET_UNREF_NODE
		put: (anObject
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
