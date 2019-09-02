Class {
	#name : #GClassBuilder,
	#superclass : #Object,
	#instVars : [
		'typeId',
		'getTypeCallback',
		'name',
		'instanceInit',
		'instanceInitCallback',
		'classInit',
		'classInitCallback',
		'interfaces',
		'parentClassStructPointer',
		'parentClass',
		'interfaceCallbacks'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #building }
GClassBuilder class >> build: aBlock [ 
	| builder |
	
	builder := self new.
	aBlock value: builder.
	^ builder install
]

{ #category : #private }
GClassBuilder >> addInterfaceGType: interfaceType init: initBlock [
	| info initInterfaceCallback |

	initInterfaceCallback := GCallback 
		signature: #(void (void *ifaz)) 
		block: initBlock.
	interfaceCallbacks add: initInterfaceCallback.	
	
	info := GInterfaceInfo new 
		interface_init: initInterfaceCallback;
		yourself.
		
	self gTypeAddInterfaceStaticType: typeId interfaceType: interfaceType info: info.
]

{ #category : #building }
GClassBuilder >> classInit: aBlock [ 

	classInit := aBlock
]

{ #category : #private }
GClassBuilder >> defineClassInit [

	classInitCallback := GCallback 
		signature: #(void (gpointer klass))
		block: [ :klass |
			parentClassStructPointer := self gTypeClassPeekParent: klass.
			classInit ifNotNil: [ classInit value: klass ] ].

]

{ #category : #private }
GClassBuilder >> defineGetType [
	
	getTypeCallback := GCallback 
		signature: #(uint32 (void))
		block: [ typeId ]
]

{ #category : #private }
GClassBuilder >> defineInstanceInit [

	instanceInitCallback := GCallback 
		signature: #(void (gpointer object))
		block: [ :object |
			parentClass gInit: object.
			instanceInit ifNotNil: [ instanceInit value: object ] ].
]

{ #category : #'library path' }
GClassBuilder >> ffiLibraryName [

	^ GObjectLibrary
]

{ #category : #private }
GClassBuilder >> gInternStaticString: string [

	^ self ffiCall: #(gchar *g_intern_static_string (const gchar *string))
]

{ #category : #accessing }
GClassBuilder >> gType [

	^ typeId
]

{ #category : #private }
GClassBuilder >> gTypeAddInterfaceStaticType: instance_type interfaceType: interface_type info: info [

	^ self ffiCall: #(void g_type_add_interface_static (
		"GType"gsize instance_type,
		"GType"gsize interface_type,
		GInterfaceInfo *info))
]

{ #category : #private }
GClassBuilder >> gTypeClassPeekParent: g_class [

	^ self ffiCall: #(gpointer g_type_class_peek_parent (gpointer g_class))
]

{ #category : #private }
GClassBuilder >> gTypeRegisterStaticSimpleParent: parent_type name: type_name classSize: class_size classInit: class_init instanceSize: instance_size instanceInit: instance_init flags: flags [

	^ self ffiCall: #(GType g_type_register_static_simple (
		"GType"gsize parent_type,
		const gchar *type_name,
		guint class_size,
		GCallback class_init,
 		guint instance_size,
 		GCallback instance_init,
 		"GTypeFlags"int32 flags))
]

{ #category : #building }
GClassBuilder >> implementGType: anInterface init: interfaceInitBlock [

	interfaces 
		at: anInterface 
		put: interfaceInitBlock
]

{ #category : #initialization }
GClassBuilder >> initialize [

	super initialize.
	interfaces := OrderedDictionary new.
	interfaceCallbacks := Set new.
]

{ #category : #installing }
GClassBuilder >> install [

	self defineClassInit.
	self defineInstanceInit.
	self defineGetType.

	typeId := self registerType.
	typeId = 0 ifTrue: [ GClassBuilderError signal: 'Class not installed.' ].

	interfaces keysAndValuesDo: [ :interfaceType :initBlock |
		self addInterfaceGType: interfaceType init: initBlock ].

	^ GClass newBuilder: self
]

{ #category : #building }
GClassBuilder >> instanceInit: aBlock [ 

	instanceInit := aBlock
]

{ #category : #building }
GClassBuilder >> name: aString [

	name := aString
]

{ #category : #building }
GClassBuilder >> parent: aGtkClass [

	parentClass := aGtkClass
]

{ #category : #accessing }
GClassBuilder >> parentClass [

	^ parentClass
]

{ #category : #private }
GClassBuilder >> registerType [

	^ self 
		gTypeRegisterStaticSimpleParent: parentClass gType
		name: (self gInternStaticString: name)
		classSize: parentClass gClassSize
		classInit: classInitCallback
		instanceSize: parentClass gSize
		instanceInit: instanceInitCallback
		flags: 0
]
