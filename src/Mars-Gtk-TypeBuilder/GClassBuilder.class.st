Class {
	#name : #GClassBuilder,
	#superclass : #Object,
	#instVars : [
		'offset',
		'typeId',
		'getTypeCallback',
		'name',
		'initCallback',
		'instanceInit',
		'instanceInitCallback',
		'classInit',
		'classInitCallback',
		'interfaces',
		'parentClassStructPointer',
		'parentClass'
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
GClassBuilder >> addInterfaceType: interfaceType init: initBlock [

	self halt
]

{ #category : #accessing }
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
GClassBuilder >> defineInit [

	initCallback := GCallback 
		signature: #(void (gpointer ginstance))
		block: [ :ginstance |
			instanceInit ifNotNil: [ instanceInit value: ginstance ] ].

]

{ #category : #private }
GClassBuilder >> defineInstanceInit [

	instanceInitCallback := GCallback 
		signature: #(gpointer (gpointer g_class))
		block: [ :g_class |
			instanceInit ifNotNil: [ instanceInit value: g_class ] ].

]

{ #category : #'library path' }
GClassBuilder >> ffiLibraryName [

	^ GObjectLibrary
]

{ #category : #private }
GClassBuilder >> gInternStaticString: string [

	^ self ffiCall: #(gchar *g_intern_static_string (const gchar *string))
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

{ #category : #accessing }
GClassBuilder >> implement: anInterface init: interfaceInitBlock [

	interfaces 
		at: anInterface 
		put: interfaceInitBlock
]

{ #category : #initialization }
GClassBuilder >> initialize [

	super initialize.
	interfaces := OrderedDictionary new
]

{ #category : #installing }
GClassBuilder >> install [

	parentClassStructPointer := nil.
	offset := 0.

	self defineClassInit.
	self defineInit.
	self defineGetType.

	typeId := self registerType.
	typeId = 0 ifTrue: [ GClassBuilderError signal: 'Class not installed.' ].

	interfaces keysAndValuesDo: [ :interfaceType :initBlock |
		self addInterfaceType: interfaces init: initBlock ].

	^ GClass newGType: typeId parent: parentClass
]

{ #category : #accessing }
GClassBuilder >> instanceInit: aBlock [ 

	instanceInit := aBlock
]

{ #category : #accessing }
GClassBuilder >> name: aString [

	name := aString
]

{ #category : #accessing }
GClassBuilder >> parent: aGtkClass [

	parentClass := aGtkClass
]

{ #category : #private }
GClassBuilder >> registerType [

	^ self 
		gTypeRegisterStaticSimpleParent: parentClass gType
		name: (self gInternStaticString: name)
		classSize: parentClass gClassSize
		classInit: classInitCallback
		instanceSize: parentClass gSize
		instanceInit: initCallback
		flags: 0
]
