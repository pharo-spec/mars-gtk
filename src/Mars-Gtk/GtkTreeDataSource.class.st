Class {
	#name : #GtkTreeDataSource,
	#superclass : #GtkTreeStore,
	#instVars : [
		'roots',
		'children',
		'orderedItems',
		'stamp'
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
		block: [ :tree_model | (self gInstance: tree_model) getFlags value ]).
	iface get_n_columns: (GCallback 
		signature: #(gint (void *tree_model)) 
		block: [ :tree_model | (self gInstance: tree_model) getNColumns ]).
	iface get_column_type: (GCallback 
		signature: #(gsize (void *tree_model, gint index)) 
		block: [ :tree_model :index | (self gInstance: tree_model) getColumnType: index ]).
	iface get_iter: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *path)) 
		block: [ :tree_model :iter :path | 
			(self gInstance: tree_model) 
				getIter: (GtkTreePath fromHandle: path) 
				iter: (GtkTreeIter fromHandle: iter) ]).
	iface get_path: (GCallback 
		signature: #(GtkTreePath *(void *tree_model, void *iter)) 
		block: [ :tree_model :iter | 
			(self gInstance: tree_model) getPath: (GtkTreeIter fromHandle: iter) ]).
	iface get_value: (GCallback 
		signature: #(void (void *tree_model, void *iter, gint column, void *value)) 
		block: [ :tree_model :iter :column :value |
			(self gInstance: tree_model) 
				getValue: (GtkTreeIter fromHandle: iter) 
				column: column 
				value: (GValue fromHandle: value) ]).
	iface iter_next: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter)) 
		block: [ :tree_model :iter | 
			(self gInstance: tree_model) iterNext: (GtkTreeIter fromHandle: iter) ]).
	iface iter_children: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *parent)) 
		block: [ :tree_model :iter :parent | 
			(self gInstance: tree_model) 
				iterChildren: (GtkTreeIter fromHandle: parent) 
				iter: (GtkTreeIter fromHandle: iter) ]).
	iface iter_has_child: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter)) 
		block: [ :tree_model :iter | 
			(self gInstance: tree_model) iterHasChild: (GtkTreeIter fromHandle: iter) ]).
	iface iter_n_children: (GCallback
		signature: #(gint (void *tree_model, void *iter)) 
		block: [ :tree_model :iter | 
			(self gInstance: tree_model) iterNChildren: (GtkTreeIter fromHandle: iter) ]).
	iface iter_nth_child: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *parent, gint n)) 
		block: [ :tree_model :iter :parent :n | 
			(self gInstance: tree_model) 
				iterNthChild: (GtkTreeIter fromHandle: parent) 
				number: n 
				iter: (GtkTreeIter fromHandle: iter) ]).
	iface iter_parent: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *child)) 
		block: [ :tree_model :iter :child | 
			(self gInstance: tree_model) 
				iterParent: (GtkTreeIter fromHandle: child) 
				iter: (GtkTreeIter fromHandle: iter) ])
]

{ #category : #accessing }
GtkTreeDataSource class >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : #accessing }
GtkTreeDataSource class >> new [

	^ (GClass gDefinitionAt: self) new
]

{ #category : #private }
GtkTreeDataSource >> assertNotNull: anObject ifFail: aBlock [ 

	(anObject isNil or: [ anObject getHandle isNull ]) ifTrue: aBlock
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
GtkTreeDataSource >> getColumnType: index [

	^ G_TYPE_STRING
]

{ #category : #'accessing store' }
GtkTreeDataSource >> getFlags [
	"GTK_TREE_MODEL_LIST_ONLY in case of a simple list (which is not the case in the experiment)"
	
	^ GTK_TREE_MODEL_ITERS_PERSIST value

]

{ #category : #'accessing store' }
GtkTreeDataSource >> getIter: path iter: iter [

	self assertNotNull: path ifFail: [ ^ false ].
	
	iter stamp: stamp.
	self flag: #TODO. "This will leak. Is like there to test"
	iter user_data: path copy.
	iter user_data2: ExternalAddress null.
	iter user_data3: ExternalAddress null.
	 
	^ true
]

{ #category : #'accessing store' }
GtkTreeDataSource >> getNColumns [

	^ 1
]

{ #category : #'accessing store' }
GtkTreeDataSource >> getPath: iter [
	| path |

	self assertNotNull: iter ifFail: [ ^ ExternalAddress null ].
	self assertNotNull: iter user_data ifFail: [ ^ ExternalAddress null ].

	path := GtkTreePath fromHandle: iter user_data. 
	^ path copy getHandle
]

{ #category : #'accessing store' }
GtkTreeDataSource >> getValue: iter column: column value: gValue [
	| path item |

	self assertNotNull: iter ifFail: [ ^ self ].
	self assertNotNull: iter user_data ifFail: [ ^ self ].

	path := self pathFromIter: iter.
	item := self itemAtPath: path.
	item ifNil: [ ^ self ].

	gValue init: (self getColumnType: column).
	gValue setString: item asString
]

{ #category : #accessing }
GtkTreeDataSource >> initialize [

	super initialize.
	stamp := 16rFFFF atRandom
	
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

	self assertNotNull: path ifFail:  [ ^ nil ].

	pathArray := path toArray.
	^ self 
		itemAt: pathArray first
		of: self roots
		then: pathArray allButFirst
]

{ #category : #'accessing store' }
GtkTreeDataSource >> iterChildren: parent iter: iter [
	| path |
	
	self assertNotNull: parent ifFail: [ ^ false ].
	self assertNotNull: parent user_data ifFail: [ ^ false ].
	
	path := self pathFromIter: parent.
	path ifNil: [ ^ false ].
	
	self flag: #TODO. "This is leaking"
	path := path copy.
	path down ifFalse: [ ^ false ].
	
	iter stamp: stamp. 
	iter user_data: path.
	
	^ true
]

{ #category : #'accessing store' }
GtkTreeDataSource >> iterHasChild: iter [
	| item path |

	children ifNil: [ ^ false ].
	self assertNotNull: iter ifFail: [ ^ false ].
	self assertNotNull: iter user_data ifFail: [ ^ false ].

	path := self pathFromIter: iter.
	item := self itemAtPath: path.
	item ifNil: [ ^ false ].
	
	^ (self childrenFor: item) notEmpty
]

{ #category : #'accessing store' }
GtkTreeDataSource >> iterNChildren: iter [
	| item path |

	children ifNil: [ ^ 0 ].
	self assertNotNull: iter ifFail: [ ^ 0 ].
	self assertNotNull: iter user_data ifFail: [ ^ 0 ].

	path := self pathFromIter: iter.
	('NCHILDREN PATH: {1}' format: { path toArray }) printToStdout.
	path toArray ifEmpty: [ ^ self roots size ].
	
	item := self itemAtPath: path.
	^ (self childrenFor: item) size
]

{ #category : #'accessing store' }
GtkTreeDataSource >> iterNext: iter [
	| path |

	self assertNotNull: iter ifFail:  [ ^ false ].	
	self assertNotNull: iter user_data ifFail:  [ ^ false ].	

	path := self pathFromIter: iter.
	self flag: #TODO. "This is leaking"
	path := path copy.
	path next ifFalse: [ ^ false ].
	
	(self itemAtPath: path) ifNil: [ ^ false ].
	
	iter stamp: stamp. 
	iter user_data: path.

	^ true
]

{ #category : #'accessing store' }
GtkTreeDataSource >> iterNthChild: parent number: n iter: iter [
	| path |

	self assertNotNull: parent ifFail: [ ^ false ].
	self assertNotNull: parent user_data ifFail: [ ^ false ].
	
	path := self pathFromIter: parent.
	self flag: #TODO. "This is leaking"
	path := path copy appendIndex: n + 1.
	
	iter stamp: stamp. 
	iter user_data: path.

	^ true
]

{ #category : #'accessing store' }
GtkTreeDataSource >> iterParent: child iter: iter [
	| path |

	self assertNotNull: child ifFail: [ ^ false ].
	self assertNotNull: child user_data ifFail: [ ^ false ].
	
	path := self pathFromIter: child.
	self flag: #TODO. "This is leaking"
	path := path copy.
	path up ifFalse: [ ^ false ].
	
	iter stamp: stamp. 
	iter user_data: path.

	^ true
]

{ #category : #private }
GtkTreeDataSource >> pathFromIter: iter [

	^ GtkTreePath fromHandle: iter user_data
]

{ #category : #accessing }
GtkTreeDataSource >> roots [

	^ roots
]

{ #category : #accessing }
GtkTreeDataSource >> roots: aCollection [

	roots := aCollection
]
