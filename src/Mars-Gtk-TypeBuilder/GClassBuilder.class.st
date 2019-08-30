Class {
	#name : #GClassBuilder,
	#superclass : #Object,
	#instVars : [
		'parentClass',
		'offset',
		'typeId',
		'getTypeCallback',
		'name',
		'initCallback',
		'instanceInit',
		'instanceInitCallback',
		'classInit',
		'classInitCallback',
		'parent',
		'interfaces'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #private }
GClassBuilder >> addInterfaceType: interfaceType init: initBlock [

		
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
			parentClass := self gTypeClassPeekParent: klass.
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
		signature: #(gpointer (gpointer g_class))
		block: [ :g_class |
			instanceInit ifNotNil: [ instanceInit value: g_class ] ].

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
		GType parent_type,
		const gchar *type_name,
		guint class_size,
		GCallback class_init,
 		guint instance_size,
 		GCallback instance_init,
 		"GTypeFlags"int32 flags))
]

{ #category : #accessing }
GClassBuilder >> implement: anInterface withInit: interfaceInitBlock [

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

	parentClass := nil.
	offset := 0.

	self defineClassInit.
	self defineGetType.

	typeId := self registerType.

	interfaces keysAndValuesDo: [ :interfaceType :initBlock |
		self addInterfaceType: interfaces init: initBlock ].

	^ GClass newType: typeId
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

	parent := aGtkClass
]

{ #category : #private }
GClassBuilder >> parentType [
	
	
]

{ #category : #private }
GClassBuilder >> registerType [
	| id |

	id := self 
		gTypeRegisterStaticSimpleParent: self parentType
		name: (self gInternStaticString: self name)
		classSize: "class_size" 0
		classInit: classInitCallback
		instanceSize: 0
		instanceInit: initCallback
		flags: 0.

	^ id
]
