"
This is GtkActionable.
I'm using this to test just because is a simple structure.
"
Class {
	#name : #GInterfaceForTest,
	#superclass : #GInterface,
	#classVars : [
		'OFFSET_ACTION_NAME',
		'OFFSET_GET_ACTION_NAME',
		'OFFSET_GET_ACTION_TARGET_VALUE',
		'OFFSET_G_IFACE',
		'OFFSET_SET_ACTION_NAME',
		'OFFSET_SET_ACTION_TARGET_VALUE'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #'field definition' }
GInterfaceForTest class >> fieldsDesc [ 
	"self rebuildFieldAccessors"

	^ super fieldsDesc, #(
	GCallback get_action_name;
  	GCallback set_action_name;
   GCallback action_name;
  	GCallback get_action_target_value;
  	GCallback set_action_target_value;
	)
]

{ #category : #accessing }
GInterfaceForTest class >> gType [ 

	^ self ffiCall: #(gsize gtk_actionable_get_type()) module: GtkLibrary
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> action_name [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ACTION_NAME) asInteger)
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> action_name: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_ACTION_NAME
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> g_iface [
	"This method was automatically generated"
	^ GTypeInterface fromHandle: (handle referenceStructAt: OFFSET_G_IFACE length: GTypeInterface byteSize)
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> g_iface: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_G_IFACE put: anObject getHandle length: GTypeInterface byteSize
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> get_action_name [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ACTION_NAME) asInteger)
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> get_action_name: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_GET_ACTION_NAME
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> get_action_target_value [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ACTION_TARGET_VALUE) asInteger)
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> get_action_target_value: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_GET_ACTION_TARGET_VALUE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> set_action_name [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_SET_ACTION_NAME) asInteger)
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> set_action_name: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_SET_ACTION_NAME
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> set_action_target_value [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_SET_ACTION_TARGET_VALUE) asInteger)
]

{ #category : #'accessing structure variables' }
GInterfaceForTest >> set_action_target_value: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_SET_ACTION_TARGET_VALUE
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
