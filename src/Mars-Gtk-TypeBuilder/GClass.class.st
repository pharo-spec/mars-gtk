Class {
	#name : #GClass,
	#superclass : #Object,
	#instVars : [
		'builder',
		'type',
		'name',
		'parent',
		'classInitialize',
		'initialize',
		'targetClass',
		'instances',
		'interfaces'
	],
	#classVars : [
		'GClasses'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #accessing }
GClass class >> gClassAt: aClass [

	^ GClasses at: aClass
]

{ #category : #private }
GClass class >> gClassesAt: aClass put: gClass [
	
	GClasses ifNil: [ GClasses := IdentityDictionary new ].
	GClasses at: aClass put: gClass
]

{ #category : #'class initialization' }
GClass class >> initialize [

	SessionManager default registerSystemClassNamed: self name
]

{ #category : #installing }
GClass class >> install: aClass [
	| gClass |

	gClass := self new.
	gClass targetClass: aClass.
	aClass install.

	self gClassesAt: aClass put: gClass.

	^ gClass
]

{ #category : #installing }
GClass class >> install: aClass as: aName [
	"Overrides the name in Gtk side. 
	 This is mostly used to allow test to install several times same class"
	| gClass |

	gClass := self new.
	gClass targetClass: aClass.
	gClass name: aName.
	gClass install.
	
	self gClassesAt: aClass put: gClass.

	^ gClass
]

{ #category : #'class initialization' }
GClass class >> shutDown: quitting [ 

	quitting ifFalse: [ ^ self ].
	GClasses := nil
]

{ #category : #accessing }
GClass >> addInterface: ifazClass initialize: aBlock [

	interfaces 
		at: ifazClass 
		put: (GCallback 
			signature: #(void (void *handle)) 
			block: [ :handle | aBlock value: (ifazClass fromHandle: handle) ])
]

{ #category : #'private installing' }
GClass >> addInterfaceGType: interfaceType initialize: initCallback [
	| info originSize |

	info := GInterfaceInfo new 
		interface_init: initCallback;
		yourself.
		
	self 
		gTypeAddInterfaceStaticType: type 
		interfaceType: interfaceType
		info: info.
	"I need to verify the implemented interfaces includes the type I just addded to 
	 be sure it was added (not all interfaces can be added to any class)"
	(self gTypeInterfaces includes: interfaceType)
		ifFalse: [ GClassError signal: 'Interface can not be added.' ]
]

{ #category : #accessing }
GClass >> classInitialize: aBlock [ 
	
	classInitialize := GCallback 
		signature: #(void (gpointer klass))
		block: [ :klass |
			"parentClassStructPointer := self gTypeClassPeekParent: klass."
			aBlock value: klass ].
]

{ #category : #'library path' }
GClass >> ffiLibraryName [
	
	^ GObjectLibrary
]

{ #category : #private }
GClass >> findInstance: handle [
	| address |

	address := handle asInteger.
	^ instances detect: [ :each | 
		each getHandle asInteger = address ]
]

{ #category : #'private primitives' }
GClass >> gInternStaticString: string [

	^ self ffiCall: #(void *g_intern_static_string (const gchar *string))
]

{ #category : #'private primitives' }
GClass >> gObjectNew: object_type [

	^ self ffiCall: #(void *g_object_new (gsize object_type, NULL))
]

{ #category : #'private primitives' }
GClass >> gTypeAddInterfaceStaticType: instance_type interfaceType: interface_type info: info [

	^ self ffiCall: #(void g_type_add_interface_static (
		"GType"gsize instance_type,
		"GType"gsize interface_type,
		GInterfaceInfo *info))
]

{ #category : #private }
GClass >> gTypeInterfaces [
	| interfaceTypes |
	
	interfaceTypes := self gTypeInterfaces: type.
	^ interfaceTypes
		readArrayOf: (GObject resolveType: #gsize) 
		until: [ :each | each isZero ]
]

{ #category : #'private primitives' }
GClass >> gTypeInterfaces: object_type [

	^ self ffiCall: #(gsize *g_type_interfaces (gsize object_type, NULL))
]

{ #category : #'private primitives' }
GClass >> gTypeRegisterStaticSimpleParent: parent_type name: type_name classSize: class_size classInit: class_init instanceSize: instance_size instanceInit: instance_init flags: flags [

	^ self ffiCall: #(GType g_type_register_static_simple (
		"GType"gsize parent_type,
		"const gchar *"void *type_name,
		guint class_size,
		GCallback class_init,
 		guint instance_size,
 		GCallback instance_init,
 		"GTypeFlags"int32 flags))
]

{ #category : #initialization }
GClass >> initialize [

	super initialize.
	interfaces := OrderedDictionary new.
	self initialize: [ :instance | instance initialize ].
	
	instances := WeakSet new
]

{ #category : #accessing }
GClass >> initialize: aBlock [
	
	initialize := GCallback
		signature: #(void (gpointer object))
		block: [ :object |
			parent gInit: object.
			aBlock value: object ]
]

{ #category : #installing }
GClass >> install [

	type := self registerType.
	type = 0 ifTrue: [ 
		GClassError signal: 'Class not installed.' ].

	interfaces keysAndValuesDo: [ :interfaceClass :initCallback |
		self 
			addInterfaceGType: interfaceClass gType 
			initialize: initCallback ]
]

{ #category : #accessing }
GClass >> interfaces [

	self flag: #TODO. "What I do with unknown interfaces?"
	^ self gTypeInterfaces collect: [ :eachType |
		GInterface allSubclasses 
			detect: [ :eachClass | eachClass gType = eachType ]
			ifNone: [ nil ] ]
]

{ #category : #accessing }
GClass >> name [

	^ name
]

{ #category : #accessing }
GClass >> name: aString [

	name := aString
]

{ #category : #'instance creation' }
GClass >> new [ 
	| handle instance |

	handle := self gObjectNew: self type.
	instance := targetClass basicNew setHandle: handle.
	instances add: instance.
	instance initialize.
	^ instance
]

{ #category : #accessing }
GClass >> parent [

	^ parent
]

{ #category : #accessing }
GClass >> parent: aClass [

	parent := aClass
]

{ #category : #'private installing' }
GClass >> registerType [

	^ self 
		gTypeRegisterStaticSimpleParent: parent gType
		name: (self gInternStaticString: (name utf8Encoded copyWith: 0))
		classSize: parent gClassSize
		classInit: classInitialize
		instanceSize: parent gSize
		instanceInit: initialize
		flags: 0
]

{ #category : #accessing }
GClass >> targetClass: aClass [ 

	targetClass := aClass.
	
	self 
		name: aClass name;
		parent: aClass superclass;
		classInitialize: [ :gclass | aClass initialize: gclass ].	
	aClass initializeInterfaces: self
]

{ #category : #accessing }
GClass >> type [

	^ type
]

{ #category : #accessing }
GClass >> typeName [

	^ self ffiCall: #(gchar *g_type_name (gsize type))
]
