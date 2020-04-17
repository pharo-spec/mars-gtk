"
I'm a base for all Gtk3 objects (not all Gtk3 references are).
"
Class {
	#name : #GObject,
	#superclass : #GBaseObject,
	#instVars : [
		'callbacks'
	],
	#pools : [
		'GConnectFlags',
		'GSignalMatchType',
		'GdkModifierType',
		'GtkAccelFlags',
		'GtkAlign',
		'GtkStateFlags',
		'GtkStateType'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #finalization }
GObject class >> finalizeResourceData: handle [
	"when marking for autoRelease, g-objects needs to be freed in a particular way."

	(self isValidHandle: handle) ifFalse: [ ^ self ].

	(self instanceIsObject: handle) 
		ifTrue: [ 
			GtkFinalizeSignal emitTarget: self handle: handle.
			GtkRunLoop defer: [ self objectUnref: handle ] ]
		ifFalse: [
			GtkZombieSignal emitTarget: self handle: handle ].
	handle beNull
]

{ #category : #accessing }
GObject class >> gClassSize [

	^ 136
]

{ #category : #'class initialization' }
GObject class >> gDefine: aClass [
	"To be called by the new method of pharo classes who extent gtk classes"
]

{ #category : #accessing }
GObject class >> gSize [

	^ 24
]

{ #category : #accessing }
GObject class >> gType [
	"answers the GType of a Gtk class. 
	 This methiod needs to be override in all my subclasses (see #generateGTypeMethods)
	 WARNING: While the type is named GType, we have a collision with the GType shared pool, 
	 that's why we use its mapped type: gsize"

	^ self ffiCall: #(gsize g_object_get_type()) module: GObjectLibrary 
]

{ #category : #utils }
GObject class >> generateGTypeMethod [

	(self class selectors includes: #gType) ifTrue: [ ^ self ].
	self class
		compile: ('gType 
	"This method was automatically generated"

	^ self ffiCall: #(gsize {1}_get_type())'
			format: { self gtkPrefix })
		classified: #accessing
]

{ #category : #utils }
GObject class >> generateGTypeMethods [
	"you can use this method to generate ALL missing gType methods. 
	 BEWARE: You will be adding incorrect gType methods since the hierarchy here is different than 
	 Gtk hierarchy. Better use #generateGTypeMethod when creating your new class"
	<script>

	self withAllSubclassesDo: [ :each |
		each generateGTypeMethod ]
]

{ #category : #utils }
GObject class >> generateInitMethod [

	(self class selectors includes: #gType) ifFalse: [ ^ self ].
	(self class selectors includes: #gInit:) ifTrue: [ ^ self ].
	
	self class
		compile: ('gInit: object 
	"This method was automatically generated"

	^ self ffiCall: #(void {1}_init(void *object))'
			format: { self gtkPrefix })
		classified: #accessing
]

{ #category : #utils }
GObject class >> generateInitMethods [
	<script>

	self withAllSubclassesDo: [ :each |
		each generateInitMethod ]
]

{ #category : #utils }
GObject class >> gtkPrefix [
		
	^ String streamContents: [ :stream |
		(self name normalizeCamelCase) substrings
			do: [ :each | stream << (each asLowercase) ]
			separatedBy: [ stream << '_' ] ]
]

{ #category : #private }
GObject class >> instance: handle isFundamentallyA: fundamental_type [

	^ self 
		ffiCall: #(gboolean g_type_check_instance_is_fundamentally_a (
			void *handle,
			gsize fundamental_type))
		module: GObjectLibrary
]

{ #category : #private }
GObject class >> instanceIsObject: handle [
		
	^ self 
		instance: handle 
		isFundamentallyA: G_TYPE_OBJECT
]

{ #category : #private }
GObject class >> objectUnref: handle [
	
	^ self ffiCall: #(gpointer g_object_unref (void *handle)) module: GObjectLibrary
]

{ #category : #private }
GObject class >> referenceCountOf: handle [

	self flag: #HACK. "I do not have a clean way to access ref_count, but Since I know 
the structure of a GObject, I know where ref_count field is stored. I will access it 
directly.
 From gobject.h: 
/**
 * GObject:
 * 
 * All the fields in the GObject structure are private 
 * to the #GObject implementation and should never be accessed directly.
 */
struct  _GObject
{
  GTypeInstance  g_type_instance;
  
  /*< private >*/
  volatile guint ref_count;
  GData         *qdata;
};"
	
	^ handle unsignedLongAt: (self resolveType: 'gsize') externalTypeSize + 1
]

{ #category : #private }
GObject class >> resolveType: aType [

	^ FFICallout new 
		requestor: self class; 
		resolveType: aType
]

{ #category : #initialization }
GObject >> autoObjectUnref [
	
	self autoRelease
]

{ #category : #'private signaling' }
GObject >> basicConnectSignal: callback [
	| id |
	
	self registerCallback: callback.
	id := self 
		signal: callback signalName
		connect: callback 
		data: callback thunk.
	callback registerId: id
]

{ #category : #accessing }
GObject >> callbacks [

	^ callbacks
]

{ #category : #signaling }
GObject >> connect: aString do: aBlock [
	"this is the basic signaling (for IO events), who share signature along them... of course 
	 this is not correct in all cases (like for example 'draw'), then you need to use the method
	 #connect:signature:do:
	 BEWARE when installing callbacks to gtk... you HAVE TO catch and fork any error happening, 
	 otherwise you will crash your image (event processing happens in VM event loop, so is fragile)"

	^ self 
		connect: aString 
		signature: #(void (void *widget, void *aData))  
 		do: [ :widget :aData | aBlock value ]
]

{ #category : #signaling }
GObject >> connect: aString signature: signature do: aBlock [
	"BEWARE when installing callbacks to gtk... you HAVE TO catch and fork any error happening, 
	 otherwise you will crash your image (event processing happens in VM event loop, so is fragile)"

	self connectSignal: (GGenericSignalCallback
		signal: aString 
		signature: signature 
		block: aBlock)
]

{ #category : #'private signaling' }
GObject >> connectSignal: callback [

	self 
		detectCallbackBySignal: callback signalName
		ifFound:  [ :aCallback | aCallback link: callback ]
		ifNone: [ self basicConnectSignal: callback ]. 
	
	GtkConnectSignalSignal emitWidget: self signal: callback signalName.
	
	^ callback
]

{ #category : #private }
GObject >> detectCallbackBySignal: aName ifFound: foundBlock ifNone: noneBlock [

	callbacks ifNil: [ ^ noneBlock value ].
	^ callbacks 
		detect: [ :each | each signalName = aName ]
		ifFound: foundBlock
		ifNone: noneBlock
]

{ #category : #signaling }
GObject >> disconnect: aString [

	callbacks isEmptyOrNil ifTrue: [ ^ self ].
	"Do not use #select:thenDo: because I want explicitly the new collection 
	 (because disconnect will remove the callback from the list)"
	(callbacks
		select: [ :each | each signalName = aString ])
		do: [ :each | self disconnectCallback: each ]
]

{ #category : #signaling }
GObject >> disconnect: aString during: aBlock [

	self 
		disconnectAll: { aString } 
		during: aBlock
]

{ #category : #signaling }
GObject >> disconnectAll [

	callbacks isEmptyOrNil ifTrue: [ ^ self ].
	callbacks copy 
		do: [ :each | self disconnectCallback: each ]
]

{ #category : #signaling }
GObject >> disconnectAll: aCollection during: aBlock [
	| matching |

	callbacks isEmptyOrNil ifTrue: [ 
		aBlock value.
		^ self ].
	
	matching := callbacks select: [ :each | aCollection includes: each signalName ].
	matching do: [ :each | | numberDisconnected |
		numberDisconnected := self disconnectCallback: each.
		self flag: #TODO. "I do not like this assertion. Or we remove it because is not 
		needed, or we model better the verification of error" 
		"self assert: numberDisconnected = 1" ].
	aBlock ensure: [
		matching do: [ :each |
			self connectSignal: each ] ]
]

{ #category : #'private signaling' }
GObject >> disconnectByData: pointerToData [

	^ self 
		disconnectMatchedMask: G_SIGNAL_MATCH_DATA 
		signal: 0
		detail: 0 
		closure: ExternalAddress null
		func:  ExternalAddress null 
		data: pointerToData
]

{ #category : #'private signaling' }
GObject >> disconnectByFunc: pointerToFunc [

	^ self 
		disconnectMatchedMask: G_SIGNAL_MATCH_DATA 
		signal: 0
		detail: 0 
		closure: ExternalAddress null
		func:  pointerToFunc
		data: ExternalAddress null
]

{ #category : #'private signaling' }
GObject >> disconnectById: anId [

	^ self 
		disconnectMatchedMask: G_SIGNAL_MATCH_ID 
		signal: anId
		detail: 0 
		closure: ExternalAddress null
		func:  ExternalAddress null 
		data: ExternalAddress null
]

{ #category : #'private signaling' }
GObject >> disconnectCallback: aCallback [
	| numberDiconnected |

	"#disconnectById: does not seems t be working, I will do it by data (and passing the pointer 
	 to the thunk as data in callback registrtation). 
	 WARNING: Also I cannot use #disconnectByFunc: as I was doing it before because the thunk id 
	 not the begining of the callback itself but the entry-point to the callback (in the VM, this 
	 will be wrapped by another function)"
	numberDiconnected := self disconnectByData: aCallback thunk.
	callbacks remove: aCallback.
	GtkDisconnectCallbackSignal 
		emitCallback: aCallback 
		number: numberDiconnected.
		
	^ numberDiconnected
]

{ #category : #'private signaling' }
GObject >> disconnectMatchedMask: mask 
	signal: signal_id 
	detail: detail 
	closure: closure 
	func: func 
	data: aData [

	^ self ffiCall: #(guint g_signal_handlers_disconnect_matched (
		self,
		GSignalMatchType mask,
		guint signal_id,
		GQuark detail,
		"GClosure *" void *closure,
		"FFICallback " void *func,
      gpointer aData)) module: GObjectLibrary
]

{ #category : #'private primitives' }
GObject >> gFree: aPointer [

	^ self ffiCall: #( void g_free(gpointer aPointer) )
]

{ #category : #'private primitives' }
GObject >> gObjectGet: aName into: aBuffer [

	self 
		ffiCall: #(void g_object_get (self, const gchar *aName, void* aBuffer, NULL)) 
		module: GObjectLibrary
]

{ #category : #'private primitives' }
GObject >> gObjectGet: aName intoAddress: aBuffer [

	self 
		ffiCall: #(void g_object_get (self, const gchar *aName, gpointer *aBuffer, NULL))
		module: GObjectLibrary		
]

{ #category : #'private primitives' }
GObject >> gObjectGetBoolean: aName [
	"a convenience method to read boolean properties"
	| buffer |
	
	buffer := FFIBool newBuffer.
	self gObjectGet: aName into: buffer.
	^ buffer booleanAt: 1
]

{ #category : #'private primitives' }
GObject >> gObjectGetDouble: aName [
	"a convenience method to read boolean properties"
	| buffer |
	
	buffer := FFIFloat64 newBuffer.
	self gObjectGet: aName into: buffer.
	^ buffer doubleAt: 1
]

{ #category : #'private primitives' }
GObject >> gObjectGetHandle: aName [
	| address |
	
	address := ExternalAddress new.
	self gObjectGet: aName intoAddress: address.
	^ address	
			
]

{ #category : #'private primitives' }
GObject >> gObjectGetHandle: aName as: aClass [
	| address |

	address := self gObjectGetHandle: aName.
	address isNull ifTrue: [ ^ nil ].

	^ aClass fromHandle: address
]

{ #category : #'private primitives' }
GObject >> gObjectGetInteger: aName [
	"a convenience method to read boolean properties"
	| buffer |
	
	buffer := FFIInt32 newBuffer.
	self gObjectGet: aName into: buffer.
	^ buffer signedLongAt: 1
]

{ #category : #'private primitives' }
GObject >> gObjectGetString: aName [
	"a convenience method to read string properties"
	| buffer |
	
	buffer := ExternalAddress new.
	self gObjectGet: aName intoAddress: buffer.
	^ buffer readStringUTF8
]

{ #category : #'private primitives' }
GObject >> gObjectSet: aName toBoolean: aBoolean [

	self 
		ffiCall: #(void g_object_set (self, const gchar *aName, gboolean aBoolean, NULL))
		module: GObjectLibrary
]

{ #category : #'private primitives' }
GObject >> gObjectSet: aName toDouble: aNumber [

	self 
		ffiCall: #(void g_object_set (self, const gchar *aName, gdouble aNumber, NULL))
		module: GObjectLibrary
]

{ #category : #'private primitives' }
GObject >> gObjectSet: aName toInteger: aNumber [

	self 
		ffiCall: #(void g_object_set (self, const gchar *aName, gint aNumber, NULL))
		module: GObjectLibrary
]

{ #category : #'private primitives' }
GObject >> gObjectSet: aName toString: aString [

	self 
		ffiCall: #(void g_object_set ( self, const gchar *aName, gchar *aString, NULL))
		module: GObjectLibrary	
]

{ #category : #accessing }
GObject >> gType [

	^ self class gType
	
]

{ #category : #'private primitives' }
GObject >> gTypeName: type [

	^ self ffiCall: #(gchar *g_type_name (gsize type))
]

{ #category : #'GT-Inspector-Extension' }
GObject >> gtInspectorCallbacksIn: composite [
	<gtInspectorPresentationOrder: 90>  

	composite fastList
		title: 'Callbacks';
		display: [ callbacks asArray ];
		when: [ callbacks isEmptyOrNil not ]
]

{ #category : #initialization }
GObject >> initialize [

	super initialize.
	self isValidHandle ifTrue: [ 
		self autoObjectUnref.
		self installDebugSignals	]
]

{ #category : #'private debugging' }
GObject >> installDebugSignals [
	"emit signals to debug"
	
	GtkCreateSignal emitWidget: self.
	GtkDestroySignal installFor: self
]

{ #category : #private }
GObject >> instanceIsFundamentallyA: fundamental_type [

	self ffiCall: #(gboolean g_type_check_instance_is_fundamentally_a (
		self,
		gsize fundamental_type)) module: GObjectLibrary
]

{ #category : #testing }
GObject >> isAlive [
	"Apparently, if #isObject returns true, then the object is still there."

	^ self getHandle isNull not 
		and: [ self isObject 
		and: [ self referenceCount > 0 ] ]
]

{ #category : #testing }
GObject >> isFloating [ 

	^ self ffiCall: #(gboolean g_object_is_floating (self))
]

{ #category : #testing }
GObject >> isMarkedForAutoRelease [

	^ self application resourceManager includesObject: self
]

{ #category : #testing }
GObject >> isObject [

	^ self instanceIsFundamentallyA: G_TYPE_OBJECT
]

{ #category : #'external resource management' }
GObject >> markForAutoRelease [
	"If it is already marked for release means the object reference is also already incresed. 
	 We skip that condition to ensure we do not have more 'objectRef' than those we want 
	 (we want just one)"

	self isMarkedForAutoRelease ifTrue: [ ^ self ].
	self objectRef.
	self autoRelease
]

{ #category : #'private referencing' }
GObject >> objectRef [

	self ffiCall: #(gpointer g_object_ref (self)) module: GObjectLibrary
]

{ #category : #'private referencing' }
GObject >> objectRefSink [

	self ffiCall: #(gpointer g_object_ref_sink (self))
]

{ #category : #'private referencing' }
GObject >> objectUnref [

	self ffiCall: #(gpointer g_object_unref (self)) module: GObjectLibrary
]

{ #category : #'private debugging' }
GObject >> referenceCount [
	"Access the reference count of this object."

	^ self class referenceCountOf: self getHandle
]

{ #category : #private }
GObject >> registerCallback: aCallback [

	callbacks ifNil: [ callbacks := Set new ].
	callbacks add: aCallback.
	
	Stdio stdout << aCallback thunk printString << ':' << aCallback tfPrintString; lf
]

{ #category : #'private signaling' }
GObject >> signal: aString connect: callback data: aData [

	^ self 
		signal: aString  
		connect: callback 
		data: aData
		flags: G_CONNECT_NONE
]

{ #category : #'private signaling' }
GObject >> signal: signalName connect: callback data: aData flags: connectFlags [

	^ self 
		ffiCall: #( gulong g_signal_connect_data ( 
			self,
			const gchar *signalName,
			GCallback callback,
			gpointer 	aData,
			NULL,
			GConnectFlags connectFlags ) ) 
		module: GObjectLibrary
]

{ #category : #'private signaling' }
GObject >> signal: signalName connect: callback data: aData flags: connectFlags variable: variable [
	
	^ self ffiCall: #( gulong g_signal_connect_data ( 
		self,
		const gchar *signalName,
		GCallback callback,
		gpointer 	aData,
		uint64 variable,
		uint64 connectFlags ) ) module: GObjectLibrary
]

{ #category : #accessing }
GObject >> typeName [

	^ self gTypeName: self gType
]

{ #category : #'private referencing' }
GObject >> weakRef: notify [ 

	^ self 
		ffiCall: #(void g_object_weak_ref (self, GCallback notify, NULL)) 
		module: GObjectLibrary
]

{ #category : #accessing }
GObject >> withCallbacksMatching: matchBlock do: aBlock [

	self callbacks 
		select: matchBlock
		thenDo: aBlock
]

{ #category : #accessing }
GObject >> withCallbacksOfType: aClass do: aBlock [

	self
		withCallbacksMatching: [ :each | each class = aClass ]
		do: aBlock
]
