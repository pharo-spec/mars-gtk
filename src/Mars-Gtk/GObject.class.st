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

	GtkFinalizeSignal emitTarget: self handle: handle.
	self objectUnref: handle.
	handle beNull
]

{ #category : #private }
GObject class >> objectUnref: handle [
	
	^ self ffiCall: #(gpointer g_object_unref (void *handle)) module: GObjectLibrary
]

{ #category : #private }
GObject class >> resolveType: aType [

	^ FFICallout new 
		requestor: self class; 
		resolveType: aType
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

	self connectSignal: (GSignalCallback 
		signal: aString 
		signature: signature 
		block: aBlock)

]

{ #category : #'private signaling' }
GObject >> connectSignal: callback [ 
	| id |
	
	self registerCallback: callback.
	id := self 
		signal: callback signalName
		connect: callback 
		data: callback thunk.
	callback registerId: id.
	GtkConnectSignalSignal emitWidget: self signal: callback signalName.
	^ callback
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

	callbacks isEmptyOrNil ifTrue: [ ^ self ].
	matching := callbacks select: [ :each | aCollection includes: each signalName ].
	matching do: [ :each | | numberDisconnected |
		self flag: #TODO. "I do not like this assertion. Or we remove it because is not 
		needed, or we model better the verification of error" 
		numberDisconnected := self disconnectCallback: each.
		self assert: numberDisconnected = 1 ].
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
		"I retain a reference to ensure it is not destroyed until I actually want to doit."
		self objectRef.
		"emit signals to debug"
		"GtkCreateSignal emitWidget: self.
		GtkDestroySignal installFor: self"	]
]

{ #category : #private }
GObject >> instanceIsFundamentallyA: fundamental_type [

	self ffiCall: #(gboolean g_type_check_instance_is_fundamentally_a (
		self,
		GType fundamental_type))
]

{ #category : #testing }
GObject >> isFloating [ 

	^ self ffiCall: #(gboolean g_object_is_floating (self))
]

{ #category : #testing }
GObject >> isObject [ 

	^ self instanceIsFundamentallyA: G_TYPE_OBJECT
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

{ #category : #private }
GObject >> registerCallback: aCallback [

	callbacks ifNil: [ callbacks := Set new ].
	callbacks add: aCallback
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
	
	^ self ffiCall: #( gulong g_signal_connect_data ( 
		self,
		const gchar *signalName,
		GCallback callback,
		gpointer 	aData,
		0,
		GConnectFlags connectFlags ) ) module: GObjectLibrary
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

{ #category : #'private referencing' }
GObject >> weakRef: notify [ 

	^ self ffiCall: #(void g_object_weak_ref (self, GCallback notify, 0)) module: GObjectLibrary
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
