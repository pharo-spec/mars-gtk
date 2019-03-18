Class {
	#name : #GdkEvent,
	#superclass : #GtkStructure,
	#pools : [
		'GdkEventType'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #private }
GdkEvent class >> eventFree: event [

	self ffiCall: #(void gdk_event_free ("GdkEvent *"void *event)) module: GdkLibrary
]

{ #category : #private }
GdkEvent class >> eventNew: type [

	^ self ffiCall: #(GdkEvent *gdk_event_new (GdkEventType type))
]

{ #category : #resources }
GdkEvent class >> ffiLibrary [

	^ GtkLibrary 
]

{ #category : #finalization }
GdkEvent class >> finalizeResourceData: aHandle [

	self eventFree: aHandle
]

{ #category : #'instance creation' }
GdkEvent class >> newType: aType [

	self flag: #TODO. "fromHandle: is workaround for a temporal problem"
	^ (self fromHandle: (self eventNew: aType)) 
		initialize;
		autoRelease
]

{ #category : #'external resource management' }
GdkEvent >> autoRelease [

	FFIExternalResourceManager addResource: self
]

{ #category : #testing }
GdkEvent >> ffiLibrary [

	^ GtkLibrary 
]

{ #category : #testing }
GdkEvent >> free [

	self ffiCall: #(void gdk_event_free (self))
]

{ #category : #testing }
GdkEvent >> isDoubleClick [

	^ false
]

{ #category : #'external resource management' }
GdkEvent >> resourceData [

	^ self getHandle
]
