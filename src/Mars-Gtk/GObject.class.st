Class {
	#name : #GObject,
	#superclass : #FFIOpaqueObject,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Misc'
}

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

	self ffiCall: #(void g_object_set (self, const gchar *aName, gchar *aString) )	
]
