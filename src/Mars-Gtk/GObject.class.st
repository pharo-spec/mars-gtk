Class {
	#name : #GObject,
	#superclass : #FFIOpaqueObject,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#pools : [
		'GConnectFlags',
		'GSignalMatchType',
		'GdkModifierType',
		'GtkAccelFlags',
		'GtkAlign',
		'GtkStateFlags',
		'GtkStateType',
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #'library path' }
GObject class >> ffiLibraryName [
	^ GtkLibrary
]

{ #category : #finalization }
GObject class >> finalizeResourceData: handle [
	"when marking for autoRelease, g-objects needs to be freed in a particular way."

	handle isNull ifTrue: [ ^ self ].
	self objectUnref: handle.
	handle beNull
]

{ #category : #private }
GObject class >> objectUnref: handle [
	
	^ self ffiCall: #(gpointer g_object_unref (void *handle))
]

{ #category : #'private signaling' }
GObject >> connect: aString do: aBlock [
	"this is the basic signaling (for IO events), who share signature along them... of course 
	 this is not correct in all cases (like for example 'draw'), then you need to use the method
	 #connect:signature:do:
	 BEWARE when installing callbacks to gtk... you HAVE TO catch and fork any error happening, 
	 otherwise you will crash your image (event processing happens in VM event loop, so is fragile)"
	^ self 
		connect: aString 
		signature: #(void (void *widget, void *aData))  
 		do: [ :widget :aData | [ aBlock value ] forkAt: Processor highIOPriority ]
]

{ #category : #'private signaling' }
GObject >> connect: aString signature: signature do: aBlock [
	"BEWARE when installing callbacks to gtk... you HAVE TO catch and fork any error happening, 
	 otherwise you will crash your image (event processing happens in VM event loop, so is fragile)"
	| callback |
	callback := FFICallback signature: signature block: aBlock.
	self registerCallback: callback.
	self signal: aString connect: callback data: ExternalAddress null
]

{ #category : #'private signaling' }
GObject >> disconnectByFunc: func [

	^ self 
		disconnectMatchedMask: G_SIGNAL_MATCH_FUNC 
		signal: 0 
		detail: 0 
		closure: ExternalAddress null
		func: func 
		data: ExternalAddress null
]

{ #category : #'private signaling' }
GObject >> disconnectMatchedMask: mask signal: signal_id detail: detail closure: closure func: func data: aData [
	^ self ffiCall: #(guint g_signal_handlers_disconnect_matched (
		self,
		GSignalMatchType mask,
		guint signal_id,
		GQuark detail,
		"GClosure *" void *closure,
		FFICallback func,
      gpointer aData))
]

{ #category : #'private primitives' }
GObject >> gFree: aPointer [

	^ self ffiCall: #( void g_free(gpointer aPointer) )
]

{ #category : #'private primitives' }
GObject >> gObjectGet: aName into: aBuffer [

	self ffiCall: #(void g_object_get (self, const gchar *aName, ByteArray aBuffer) )
]

{ #category : #'private primitives' }
GObject >> gObjectGet: aName intoAddress: aBuffer [

	self ffiCall: #(void g_object_get (self, const gchar *aName, gpointer *aBuffer) )
]

{ #category : #'private primitives' }
GObject >> gObjectSet: aName toBoolean: aBoolean [

	self ffiCall: #(void g_object_set (self, const gchar *aName, Boolean aBoolean) )	
]

{ #category : #'private primitives' }
GObject >> gObjectSet: aName toString: aString [

	self ffiCall: #(void g_object_set (self, const gchar *aName, gchar *aString, 0) )	
]

{ #category : #initialization }
GObject >> initialize [
	"cancel chain because superclass attempts to setHandle: 
	 (which is incorrect, probably I should patch UFFI)"
]

{ #category : #private }
GObject >> objectReference [
	self ffiCall: #(gpointer g_object_ref (self))
]

{ #category : #private }
GObject >> objectUnreference [
	self ffiCall: #(gpointer g_object_unref (self))
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
		GConnectFlags connectFlags ) )
		
]
