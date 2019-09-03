Class {
	#name : #GClass,
	#superclass : #Object,
	#instVars : [
		'builder',
		'type',
		'name',
		'parent',
		'callbacks',
		'classInitialize',
		'initialize',
		'targetClass',
		'instances'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #installing }
GClass class >> install: aClass [
	| gClass |

	gClass := self new.
	gClass targetClass: aClass.
	aClass install.

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

	^ gClass
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
GClass >> findInstance: object [

	^ instances detect: [ :each | each getHandle = object ]
]

{ #category : #'private primitives' }
GClass >> gInternStaticString: string [

	^ self ffiCall: #(gchar *g_intern_static_string (const gchar *string))
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
	| interfaces |
	
	interfaces := self gTypeInterfaces: self gType.
	^ interfaces
		readArrayOf: (GObject resolveType: #gsize) 
		until: [ :each | each isZero ]
]

{ #category : #'private primitives' }
GClass >> gTypeInterfaces: type [ 

	^ self ffiCall: #(gsize *g_type_interfaces (gsize type, NULL))
]

{ #category : #'private primitives' }
GClass >> gTypeRegisterStaticSimpleParent: parent_type name: type_name classSize: class_size classInit: class_init instanceSize: instance_size instanceInit: instance_init flags: flags [

	^ self ffiCall: #(GType g_type_register_static_simple (
		"GType"gsize parent_type,
		const gchar *type_name,
		guint class_size,
		GCallback class_init,
 		guint instance_size,
 		GCallback instance_init,
 		"GTypeFlags"int32 flags))
]

{ #category : #initialization }
GClass >> initialize [

	super initialize.
	instances := WeakSet new.
	callbacks := Set new.
	self initialize: [ :instance | ]
]

{ #category : #accessing }
GClass >> initialize: aBlock [
	
	initialize := GCallback
		signature: #(void (gpointer object))
		block: [ :object |
			parent gInit: object.
			aBlock value: (self findInstance: object) ].
]

{ #category : #installing }
GClass >> install [

	type := self registerType.
	type = 0 ifTrue: [ 
		GClassError signal: 'Class not installed.' ].

	"interfaces keysAndValuesDo: [ :interfaceType :initBlock |
		self addInterfaceGType: interfaceType init: initBlock ]."
]

{ #category : #accessing }
GClass >> interfaces [

	^ self gTypeInterfaces collect: [ :eachType |
		GInterface allSubclasses 
			detect: [ :eachClass | eachClass gType = eachType ] ]
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
	instance := targetClass fromHandle: handle.
	instances add: instance.
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
		name: (self gInternStaticString: name)
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
	"aClass initializeInterfaces: self"
]

{ #category : #accessing }
GClass >> type [

	^ type
]

{ #category : #accessing }
GClass >> typeName [

	^ self ffiCall: #(gchar *g_type_name (gsize type))
]
