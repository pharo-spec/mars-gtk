"
I represent a class in the Gtk environment. 
I'm used to extent GObject, installing methods that will be executed in Pharo from the context of Gtk3. 

Basically, I'm used to extend Gtk classes from within the Pharo environment. 
This is used when we want to implement our own interfaces (like for example for tree stores or source completion implementations).

How to use it is somehow complicated (but of course, doable).
This is a list of minimal requirements: 

1. You need to subclass first from the component you want to extent (usually GObject, but 
you can extend any Gtk class). To be able to extend a class, the class needs to have defined the 
#gSize and #gClassSize methods! (otherwise your system will crash).
See GObject class>>gSize and GObject class>>gClassSize for examples.

2. You need to override the class method #gDefine: (see GObject class>>#gDefine: and overrides as 
examples).

3. Tipically, you will want to implement an interface. You will need to map this interface as a 
child of GInterface and you will need to add it in your #gDefine: method. See GtkSourceCompletionProvider>>#gDefine: as an example.

4. You need to override new and replace it for: 

new 

	^ (GClass gDefinitionAt: self) new
	
There are several examples in the system that does this like *class:GtkPharoSourceCompletionProvider*. 
You can check at them as examples.

"
Class {
	#name : #GClass,
	#superclass : #Object,
	#instVars : [
		'type',
		'name',
		'parent',
		'classInitialize',
		'initialize',
		'targetClass',
		'instances',
		'interfaces',
		'interfaceStructures'
	],
	#classVars : [
		'GClasses'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-ClassBuilder'
}

{ #category : #private }
GClass class >> gClassAt: aClass [

	^ self gClasses at: aClass
]

{ #category : #private }
GClass class >> gClassAt: aClass ifAbsent: aBlock [

	^ self gClasses
		at: aClass 
		ifAbsent: aBlock
]

{ #category : #private }
GClass class >> gClassAt: aClass put: gClass [
	
	^ self gClasses at: aClass put: gClass
]

{ #category : #private }
GClass class >> gClasses [

	^ GClasses ifNil: [ GClasses := IdentityDictionary new ]
]

{ #category : #accessing }
GClass class >> gDefinitionAt: aClass [
	"Answers a GClass definition of aClass. 
	 if the definition does not yet exits, it tries to install a new definition by calling
	 the #gDefine: hook method."
	| gClass |

	gClass := self gClassAt: aClass ifAbsent: [ nil ].
	gClass ifNil: [
		gClass := self 
			install: aClass 
			with: [ :c | aClass gDefine: c ] ].
	
	^ gClass
]

{ #category : #'class initialization' }
GClass class >> initialize [

	SessionManager default registerSystemClassNamed: self name
]

{ #category : #installing }
GClass class >> install: aClass [

	^ self 
		install: aClass 
		with: [ :gClass | ]
]

{ #category : #installing }
GClass class >> install: aClass with: aBlock [

	^ self new 
		targetClass: aClass;
		prepare: aBlock;
		install
]

{ #category : #installing }
GClass class >> install: aClass withName: aName [
	"Overrides the name in Gtk side. 
	 This is mostly used to allow test to install several times same class"

	^ self 
		install: aClass 
		with: [ :gClass | gClass name: aName ]
]

{ #category : #accessing }
GClass class >> reset [

	GClasses := nil
]

{ #category : #'class initialization' }
GClass class >> shutDown: quitting [ 

	quitting ifFalse: [ ^ self ].
	self reset
]

{ #category : #'class initialization' }
GClass class >> startUp: resuming [ 

	resuming ifFalse: [ ^ self ].
	self reset
]

{ #category : #accessing }
GClass >> addInterface: interfaceClass initialize: aBlock [

	interfaces 
		at: interfaceClass
		put: (GCallback 
			signature: #(void (void *handle)) 
			block: [ :handle | | interface | 
				interface := interfaceClass fromHandle: handle.
				interfaceStructures add: interface.
				aBlock value: interface ])
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

	^ instances at: handle asInteger
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
	instances := WeakIdentityValueDictionary new.
	interfaces := OrderedDictionary new.
	interfaceStructures := Set new.
	self initialize: [ :instance | instance initialize ].
	self classInitialize: [ :gclass | ].	
	
]

{ #category : #accessing }
GClass >> initialize: aBlock [
	
	initialize := GCallback
		signature: #(void (gpointer object))
		block: [ :object | aBlock value: object ]
]

{ #category : #installing }
GClass >> install [

	type := self registerType.
	type = 0 ifTrue: [ 
		GClassError signal: 'Class not installed.' ].

	interfaces keysAndValuesDo: [ :interfaceClass :initCallback |
		self 
			addInterfaceGType: interfaceClass gType 
			initialize: initCallback ].
		
	self class 
		gClassAt: targetClass 
		put: self
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
	instances at: handle asInteger put: instance.
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

{ #category : #initialization }
GClass >> prepare: aBlock [

	aBlock value: self
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
	"some defaults (they can be override in the prepare block)"
	self 
		name: aClass name;
		parent: aClass superclass
]

{ #category : #accessing }
GClass >> type [

	^ type
]

{ #category : #accessing }
GClass >> typeName [

	^ self ffiCall: #(gchar *g_type_name (gsize type))
]
