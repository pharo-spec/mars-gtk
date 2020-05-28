Class {
	#name : #GtkTreeDataSource,
	#superclass : #GtkTreeStore,
	#instVars : [
		'roots',
		'children',
		'orderedItems'
	],
	#pools : [
		'GType',
		'GtkTreeModelFlags'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #accessing }
GtkTreeDataSource class >> gClass [

	^ GClass gClassAt: self
]

{ #category : #accessing }
GtkTreeDataSource class >> gDefine: gClass [

	gClass parent: GtkTreeStore.
	gClass
		addInterface: GtkTreeModelIface 
		initialize: [ :interface | self gDefineTreeStoreInterface: interface ]
]

{ #category : #accessing }
GtkTreeDataSource class >> gDefineTreeStoreInterface: iface [

	iface get_flags: (GCallback 
		signature: #("GtkTreeModelFlags"gint (void *tree_model)) 
		block: [ :tree_model | (self gInstance: tree_model) flags value ]).
	iface get_n_columns: (GCallback 
		signature: #(gint (void *tree_model)) 
		block: [ :tree_model | (self gInstance: tree_model) nColumns ]).
	iface get_column_type: (GCallback 
		signature: #(gsize (void *tree_model, gint index)) 
		block: [ :tree_model :index | (self gInstance: tree_model) columnTypeAt: index ]).
	iface get_iter: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *path)) 
		block: [ :tree_model :iter :path | 
			(self gInstance: tree_model) 
				storeIterAtPath: (GtkTreePath fromHandle: path) 
				into: (GtkTreeIter fromHandle: iter) ]).
	iface get_path: (GCallback 
		signature: #(GtkTreePath *(void *tree_model, void *iter)) 
		block: [ :tree_model :iter | 
			(self gInstance: tree_model) pathAtIter: (GtkTreeIter fromHandle: iter) ]).
	iface get_value: (GCallback 
		signature: #(void (void *tree_model, void *iter, gint column, void *value)) 
		block: [ :tree_model :iter :column :value |
			(self gInstance: tree_model) 
				storeValueAt: (GtkTreeIter fromHandle: iter) 
				column: column 
				into: (GValue fromHandle: value) ]).
	iface iter_next: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter)) 
		block: [ :tree_model :iter | 
			(self gInstance: tree_model) storeIterNextInto: (GtkTreeIter fromHandle: iter) ]).
	iface iter_children: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *parent)) 
		block: [ :tree_model :iter :parent | 
			(self gInstance: tree_model) 
				storeIterFirstChildren: (GtkTreeIter fromHandle: parent) 
				into: (GtkTreeIter fromHandle: iter) ]).
	iface iter_has_child: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter)) 
		block: [ :tree_model :iter | 
			(self gInstance: tree_model) iterHasChild: (GtkTreeIter fromHandle: iter) ]).
	iface iter_n_children: (GCallback
		signature: #(gint (void *tree_model, void *iter)) 
		block: [ :tree_model :iter | 
			(self gInstance: tree_model) nChildren: (GtkTreeIter fromHandle: iter) ]).
	iface iter_nth_child: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *parent, gint n)) 
		block: [ :tree_model :iter :parent :n | 
			(self gInstance: tree_model) 
				storeChildIter: (GtkTreeIter fromHandle: parent) 
				at: n 
				into: (GtkTreeIter fromHandle: iter) ]).
	iface iter_parent: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *child)) 
		block: [ :tree_model :iter :child | 
			(self gInstance: tree_model) 
				storeParent: (GtkTreeIter fromHandle: child) 
				into: (GtkTreeIter fromHandle: iter) ])
]

{ #category : #accessing }
GtkTreeDataSource class >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : #accessing }
GtkTreeDataSource class >> new [

	^ (GClass gDefinitionAt: self) new
]

{ #category : #accessing }
GtkTreeDataSource >> children: aBlock [

	children := aBlock
]

{ #category : #accessing }
GtkTreeDataSource >> childrenFor: element [

	children ifNil: [ ^ #() ].
	^ children value: element
]

{ #category : #'accessing store' }
GtkTreeDataSource >> columnTypeAt: index [

	^ G_TYPE_STRING
]

{ #category : #'accessing store' }
GtkTreeDataSource >> flags [
	"GTK_TREE_MODEL_LIST_ONLY in case of a simple list (which is not the case in the experiment)"

	^ GTK_TREE_MODEL_ITERS_PERSIST value
]

{ #category : #private }
GtkTreeDataSource >> itemAt: index of: anArray then: path [
	"dives into elements of tree to find the one that corresponds to path"
	| element |
	
	anArray size < index ifTrue: [ ^ nil ].
	element := anArray at: index.
	^ path 
		ifNotEmpty: [ 
			self 
				itemAt: path first 
				of: (self childrenFor: element) 
				then: path allButFirst ]
		ifEmpty: [ 
			element ]
]

{ #category : #private }
GtkTreeDataSource >> itemAtPath: path [
	| pathArray |

	self verify: path ifNil:  [ ^ nil ].

	pathArray := path toArray.
	^ self 
		itemAt: pathArray first
		of: self roots
		then: pathArray allButFirst
]

{ #category : #'accessing store' }
GtkTreeDataSource >> iterHasChild: iter [
	| item path |

thisContext method selector printToStdout.

	self verify: iter ifNil: [ ^ false ].

	children ifNil: [ ^ false ].

	path := self pathFromIter: iter.
	path ifNil: [ ^ false ].
	
	item := self itemAtPath: path.
	^ (children value: item) notEmpty
]

{ #category : #'accessing store' }
GtkTreeDataSource >> nChildren: iter [
	| item path |

thisContext method selector printToStdout.

	self verify: iter ifNil: [ ^ 0 ].
	children ifNil: [ ^ 0 ].

	path := self pathFromIter: iter.
	path ifNil: [ ^ 0 ].
	
	item := self itemAtPath: path.
	^ (children value: item) size
]

{ #category : #'accessing store' }
GtkTreeDataSource >> nColumns [

	^ 1
]

{ #category : #'accessing store' }
GtkTreeDataSource >> pathAtIter: iter [
thisContext method selector printToStdout.

	iter user_data printToStdout.
	^ iter user_data
]

{ #category : #private }
GtkTreeDataSource >> pathFromIter: iter [
	| path |

	path := iter user_data.
	self verify: path ifNil: [ ^ nil ].
	
	^ GtkTreePath fromHandle: path
]

{ #category : #accessing }
GtkTreeDataSource >> roots [

	^ roots
]

{ #category : #accessing }
GtkTreeDataSource >> roots: aCollection [

	roots := aCollection
]

{ #category : #'accessing store' }
GtkTreeDataSource >> storeChildIter: parent at: n into: iter [
	| path |
thisContext method selector printToStdout.

	self verify: parent ifNil: [ ^ false ].
	
	path := self pathFromIter: parent.
	path ifNil: [ ^ false ].
	
	self flag: #TODO. "This is leaking"
	path := path copy appendIndex: n.
	
	iter user_data: path getHandle.
	^ true
]

{ #category : #'accessing store' }
GtkTreeDataSource >> storeIterAtPath: path into: iter [
	| newPath |
thisContext method selector printToStdout.
	
	self verify: path ifNil: [ ^ false ].
	
	self flag: #TODO. "This will leak. Is like there to test"
	newPath := path copy.
	newPath printToStdout.
	iter user_data: newPath.
	iter user_data2: ExternalAddress null.
	iter user_data3: ExternalAddress null.
	 
	^ true
]

{ #category : #'accessing store' }
GtkTreeDataSource >> storeIterFirstChildren: parent into: iter [
	| path |
thisContext method selector printToStdout.
	
	self verify: parent ifNil: [ ^ false ].
	
	path := self pathFromIter: parent.
	path ifNil: [ ^ false ].
	
	self flag: #TODO. "This is leaking"
	path := path copy firstChild.
	
	iter user_data: path.
	
	^ true
]

{ #category : #'accessing store' }
GtkTreeDataSource >> storeIterNextInto: iter [
	| path |
thisContext method selector printToStdout.
	
	self verify: iter ifNil: [ ^ false ].
	
	path := self pathFromIter: iter.
	path ifNil: [ ^ false ].
	
	self flag: #TODO. "This is leaking"
	path := path copy moveNext.
	(self itemAtPath: path) ifNil: [ ^ false ].
	
	iter user_data: path.

	^ true
]

{ #category : #'accessing store' }
GtkTreeDataSource >> storeParent: child into: iter [
	| path |
thisContext method selector printToStdout.

	self verify: child ifNil: [ ^ false ].
	
	path := self pathFromIter: child.
	path ifNil: [ ^ false ].
	
	self flag: #TODO. "This is leaking"
	path := path copy up.
	
	iter user_data: path.

	^ true
]

{ #category : #'accessing store' }
GtkTreeDataSource >> storeValueAt: iter column: column into: gValue [
	| path item |
thisContext method selector printToStdout.

	self verify: iter ifNil: [ ^ self ].

	path := self pathFromIter: iter.
	path ifNil: [ ^ self ].
	
	item := self itemAtPath: path.
	item ifNil: [ ^ self ].

	gValue init: (self columnTypeAt: column).
	gValue setString: item asString
]

{ #category : #private }
GtkTreeDataSource >> verify: path ifNil: aBlock [ 

	(path isNil or: [ path isNull ]) ifTrue: aBlock
]
