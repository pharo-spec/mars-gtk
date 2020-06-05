"
! GtkTreeDataStore

A data store is a special implementation of a tree store that will provide data directly from the image (otherwise, with a ==GtkTreeStore== you need to provide elements ''before'', which is time consuming and not very friendly to calculate properties).

Plesse, notice that the usage of a ==GtkTreeDataStore== is not magical and it will not solve all size/time to load problems, since ==GtkTreeView== fetches all elements in a leaf before showing it (meaning that if you have 10k elements in a list, it will take time to be filled).
"
Class {
	#name : #GtkTreeDataStore,
	#superclass : #GtkTreeStore,
	#instVars : [
		'roots',
		'stamp',
		'paths',
		'childrenBlock',
		'children',
		'images',
		'columns',
		'isList'
	],
	#pools : [
		'GType',
		'GtkTreeModelFlags'
	],
	#category : #'Mars-Gtk-Widget-Tree-Store'
}

{ #category : #accessing }
GtkTreeDataStore class >> gClass [

	^ GClass gClassAt: self
]

{ #category : #accessing }
GtkTreeDataStore class >> gDefine: gClass [

	gClass parent: GtkTreeStore.
	gClass
		addInterface: GtkTreeModelIface 
		initialize: [ :interface | self gDefineTreeStoreInterface: interface ]
]

{ #category : #accessing }
GtkTreeDataStore class >> gDefineTreeStoreInterface: iface [

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
GtkTreeDataStore class >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : #accessing }
GtkTreeDataStore class >> new [

	^ (GClass gDefinitionAt: self) new
]

{ #category : #accessing }
GtkTreeDataStore >> addColumn: aColumn [

	aColumn store: self.
	columns add: aColumn
]

{ #category : #private }
GtkTreeDataStore >> assertNotNull: anObject ifFail: aBlock [ 

	(anObject isNil or: [ anObject getHandle isNull ]) ifTrue: aBlock
]

{ #category : #accessing }
GtkTreeDataStore >> beList [

	isList := true
]

{ #category : #accessing }
GtkTreeDataStore >> children: aBlock [

	childrenBlock := aBlock
]

{ #category : #accessing }
GtkTreeDataStore >> childrenFor: element [

	childrenBlock ifNil: [ ^ #() ].
	^ children
		at: element 
		ifAbsentPut: [ childrenBlock value: element ]
]

{ #category : #accessing }
GtkTreeDataStore >> columns [

	^ columns
]

{ #category : #accessing }
GtkTreeDataStore >> columns: aCollection [

	columns := aCollection
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getColumnType: index [

	^ (columns at: (index + 1)) gType
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getFlags [
	"GTK_TREE_MODEL_LIST_ONLY in case of a simple list (which is not the case in the experiment)"
	| flags |

	flags := GTK_TREE_MODEL_ITERS_PERSIST value.
	isList ifTrue: [ 
		 flags := flags | GTK_TREE_MODEL_LIST_ONLY value ].
	^ flags
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getIter: path iter: iter [
	| item iterPath |

	self assertNotNull: path ifFail: [ ^ false ].

	item := self itemAtPath: path ifAbsent: [ ^ false ].
	iterPath := self 
		pathAtItem: item
		ifAbsentPut: [ path copy ].

	iter stamp: stamp.
	iter user_data: iterPath.
	iter user_data2: ExternalAddress null.
	iter user_data3: ExternalAddress null.
	 
	^ true
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getNColumns [

	^ columns size
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getPath: iter [
	| path |

	self assertNotNull: iter ifFail: [ ^ ExternalAddress null ].
	self assertNotNull: iter user_data ifFail: [ ^ ExternalAddress null ].

	path := GtkTreePath fromHandle: iter user_data. 
	"This will be released by the caller"
	^ path copy getHandle
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getValue: iter column: columnNumber value: gValue [
	| path item column |

	self assertNotNull: iter ifFail: [ ^ self ].
	self assertNotNull: iter user_data ifFail: [ ^ self ].

	path := self pathFromIter: iter.
	item := self 
		itemAtPath: path 
		ifAbsent: [ ^ self ].

	column := columns at: (columnNumber + 1).
	gValue init: column gType.
	column setValueOf: item to: gValue.
]

{ #category : #'private cache' }
GtkTreeDataStore >> imageAt: anObject ifAbsentPut: aBlock [

	^ images 
		at: anObject
		ifAbsentPut: aBlock
]

{ #category : #initialization }
GtkTreeDataStore >> initialize [

	super initialize.
	stamp := 16rFFFF atRandom.
	isList := false.
	paths := IdentityDictionary new.
	children := IdentityDictionary new.
	images := Dictionary new.
	columns := OrderedCollection new.
	
	self registerForFinalize
]

{ #category : #private }
GtkTreeDataStore >> itemAt: index of: anArray then: path [
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
GtkTreeDataStore >> itemAtPath: path [
	| pathArray |

	self assertNotNull: path ifFail:  [ ^ nil ].

	pathArray := path toArray.
	^ self 
		itemAt: pathArray first
		of: self roots
		then: pathArray allButFirst
]

{ #category : #private }
GtkTreeDataStore >> itemAtPath: path ifAbsent: aBlock [
	
	^ (self itemAtPath: path) ifNil: aBlock
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterChildren: parent iter: iter [
	| path item itemChildren iterPath |

	self assertNotNull: parent ifFail: [ ^ false ].
	self assertNotNull: parent user_data ifFail: [ ^ false ].
	
	path := self pathFromIter: parent.
	item := self 
		itemAtPath: path 
		ifAbsent: [ ^ false ].
	
	itemChildren := self childrenFor: item.
	itemChildren ifEmpty: [ ^ false ].
	
	iterPath := self 
		pathAtItem: itemChildren first 
		ifAbsentPut: [ path copy down ]. 
		
	iter stamp: stamp. 
	iter user_data: iterPath.
	
	^ true
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterHasChild: iter [
	| item path |

	childrenBlock ifNil: [ ^ false ].
	self assertNotNull: iter ifFail: [ ^ false ].
	self assertNotNull: iter user_data ifFail: [ ^ false ].

	path := self pathFromIter: iter.
	item := self itemAtPath: path ifAbsent: [ ^ false ].
	
	^ (self childrenFor: item) notEmpty
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterNChildren: iter [
	| item path |

	childrenBlock ifNil: [ ^ 0 ].
	self assertNotNull: iter ifFail: [ ^ 0 ].
	self assertNotNull: iter user_data ifFail: [ ^ 0 ].

	path := self pathFromIter: iter.
	path toArray ifEmpty: [ ^ self roots size ].
	
	item := self itemAtPath: path ifAbsent: [ ^ 0 ].
	^ (self childrenFor: item) size
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterNext: iter [
	| path item iterPath |

	self assertNotNull: iter ifFail:  [ ^ false ].	
	self assertNotNull: iter user_data ifFail:  [ ^ false ].	

	path := self pathFromIter: iter.
	path := path copy next.
	item := self itemAtPath: path ifAbsent: [ nil].
	item ifNil: [
		path free.
		^ false ].
	iterPath := self pathAtItem: item.
	iterPath 
		ifNotNil: [ path free "I will not need this" ]
		ifNil: [
			iterPath := path.
			self pathAtItem: item put: iterPath ].
	
	iter stamp: stamp. 
	iter user_data: iterPath.

	^ true
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterNthChild: parent number: n iter: iter [
	| path childNumber item itemChildren iterPath |

	self assertNotNull: parent ifFail: [ ^ false ].
	self assertNotNull: parent user_data ifFail: [ ^ false ].
	
	path := self pathFromIter: parent.
	item := self itemAtPath: path.
	item ifNil: [ ^ false ].

	childNumber := n + 1. "n is zero based"	
	itemChildren := self childrenFor: item.
	itemChildren size < childNumber ifTrue: [ ^ false ].
	
	iterPath := paths 
		at: (itemChildren at: childNumber) 
		ifAbsentPut: [ | childPath |
			childPath := path copy.
			childPath appendIndex: n.
			childPath ]. 
	
	iter stamp: stamp. 
	iter user_data: iterPath.

	^ true
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterParent: child iter: iter [
	| path item iterPath |

	self assertNotNull: child ifFail: [ ^ false ].
	self assertNotNull: child user_data ifFail: [ ^ false ].
	
	path := self pathFromIter: child.

	path := path copy.
	path up ifFalse: [ 
		path free.
		^ false ].
	
	item := self 
		itemAtPath: path 
		ifAbsent: [ 
			path free.
			^ false ].

	iterPath := self pathAtItem: item.
	iterPath 
		ifNotNil: [ path free. "I will not need this" ]
		ifNil: [ 
			iterPath := path.
			self pathAtItem: item put: iterPath ]. 
		 
	iter stamp: stamp. 
	iter user_data: iterPath.

	^ true
]

{ #category : #'private cache' }
GtkTreeDataStore >> pathAtItem: item [

	^ self pathAtItem: item ifAbsent: [ nil ]
]

{ #category : #'private cache' }
GtkTreeDataStore >> pathAtItem: item ifAbsent: aBlock [

	^ paths 
		at: item 
		ifAbsent: aBlock
]

{ #category : #'private cache' }
GtkTreeDataStore >> pathAtItem: item ifAbsentPut: aBlock [

	^ paths 
		at: item 
		ifAbsentPut: aBlock
]

{ #category : #'private cache' }
GtkTreeDataStore >> pathAtItem: item put: aPath [ 

	paths at: item put: aPath
]

{ #category : #private }
GtkTreeDataStore >> pathFromIter: iter [

	^ GtkTreePath fromHandle: iter user_data
]

{ #category : #initialization }
GtkTreeDataStore >> registerForFinalize [
	
	"I use 'stamp' and not self because I do not want the shallow copy of an external store, 
	 and stamp is a single number that will be collected along with it"
	self finalizationRegistry
		add: stamp
		executor: (GtkTreeDataStoreExecutor new 
			dictionaryList: { paths. children };
			yourself)	
]

{ #category : #accessing }
GtkTreeDataStore >> roots [

	^ roots
]

{ #category : #accessing }
GtkTreeDataStore >> roots: aCollection [

	roots := aCollection
]
