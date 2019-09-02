"
A structure that provides information to the type system which is used specifically for managing interface types.

struct GInterfaceInfo
struct GInterfaceInfo {
  GInterfaceInitFunc     interface_init;
  GInterfaceFinalizeFunc interface_finalize;
  gpointer               interface_data;
};

https://developer.gnome.org/gobject/stable/gobject-Type-Information.html#GInterfaceInfo
"
Class {
	#name : #GInterfaceInfo,
	#superclass : #GtkStructure,
	#classVars : [
		'OFFSET_INTERFACE_DATA',
		'OFFSET_INTERFACE_FINALIZE',
		'OFFSET_INTERFACE_INIT'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #'field definition' }
GInterfaceInfo class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
	"GInterfaceInitFunc"GCallback     interface_init;
	"GInterfaceFinalizeFunc"GCallback interface_finalize;
	gpointer               interface_data;	
	)
]

{ #category : #'accessing structure variables' }
GInterfaceInfo >> interface_data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_INTERFACE_DATA) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GInterfaceInfo >> interface_data: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_INTERFACE_DATA put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GInterfaceInfo >> interface_finalize [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_INTERFACE_FINALIZE) asInteger)
]

{ #category : #'accessing structure variables' }
GInterfaceInfo >> interface_finalize: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_INTERFACE_FINALIZE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GInterfaceInfo >> interface_init [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_INTERFACE_INIT) asInteger)
]

{ #category : #'accessing structure variables' }
GInterfaceInfo >> interface_init: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_INTERFACE_INIT
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
