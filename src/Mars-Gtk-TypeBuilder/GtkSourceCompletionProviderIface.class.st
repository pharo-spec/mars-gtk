Class {
	#name : #GtkSourceCompletionProviderIface,
	#superclass : #GInterfaceDefinition,
	#classVars : [
		'OFFSET_ACTIVATE_PROPOSAL',
		'OFFSET_GET_ACTIVATION',
		'OFFSET_GET_GICON',
		'OFFSET_GET_ICON',
		'OFFSET_GET_ICON_NAME',
		'OFFSET_GET_INFO_WIDGET',
		'OFFSET_GET_INTERACTIVE_DELAY',
		'OFFSET_GET_NAME',
		'OFFSET_GET_PRIORITY',
		'OFFSET_GET_START_ITER',
		'OFFSET_G_IFACE',
		'OFFSET_MATCH',
		'OFFSET_POPULATE',
		'OFFSET_UPDATE_INFO'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #'field definition' }
GtkSourceCompletionProviderIface class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ super fieldsDesc, #(
	GCallback get_name;
	GCallback get_icon;
	GCallback get_icon_name;
	GCallback get_gicon;
	GCallback populate;
	GCallback match;
	GCallback get_activation;
	GCallback get_info_widget;
	GCallback update_info;
	GCallback get_start_iter;
	GCallback activate_proposal;
	GCallback get_interactive_delay;
	GCallback get_priority;
	)
]

{ #category : #accessing }
GtkSourceCompletionProviderIface class >> gType [ 
	"This method was automatically generated"

	^ self 
		ffiCall: #(gsize gtk_source_completion_provider_get_type())
		module: GtkSourceViewLibrary
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> activate_proposal [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ACTIVATE_PROPOSAL) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> activate_proposal: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_ACTIVATE_PROPOSAL
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> g_iface [
	"This method was automatically generated"
	^ GTypeInterface fromHandle: (handle referenceStructAt: OFFSET_G_IFACE length: GTypeInterface byteSize)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> g_iface: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_G_IFACE put: anObject getHandle length: GTypeInterface byteSize
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_activation [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ACTIVATION) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_activation: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_GET_ACTIVATION
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_gicon [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_GICON) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_gicon: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_GET_GICON
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_icon [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ICON) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_icon: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_GET_ICON
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_icon_name [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ICON_NAME) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_icon_name: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_GET_ICON_NAME
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_info_widget [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_INFO_WIDGET) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_info_widget: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_GET_INFO_WIDGET
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_interactive_delay [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_INTERACTIVE_DELAY) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_interactive_delay: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_GET_INTERACTIVE_DELAY
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_name [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_NAME) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_name: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_GET_NAME
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_priority [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_PRIORITY) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_priority: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_GET_PRIORITY
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_start_iter [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_START_ITER) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> get_start_iter: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_GET_START_ITER
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> match [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_MATCH) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> match: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_MATCH
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> populate [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_POPULATE) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> populate: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_POPULATE
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> update_info [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_UPDATE_INFO) asInteger)
]

{ #category : #'accessing structure variables' }
GtkSourceCompletionProviderIface >> update_info: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_UPDATE_INFO
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]
