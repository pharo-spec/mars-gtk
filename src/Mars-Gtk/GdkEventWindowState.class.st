"
https://developer.gnome.org/gdk2/stable/gdk2-Event-Structures.html#GdkEventWindowState
"
Class {
	#name : #GdkEventWindowState,
	#superclass : #GdkEvent,
	#classVars : [
		'OFFSET_CHANGED_MASK',
		'OFFSET_NEW_WINDOW_STATE',
		'OFFSET_SEND_EVENT',
		'OFFSET_TYPE',
		'OFFSET_WINDOW'
	],
	#pools : [
		'GdkEventType'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #'field definition' }
GdkEventWindowState class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
  	GdkEventType type;
  	"GdkWindow *"void *window;
  	gint8 send_event;
  	GdkWindowState changed_mask;
	GdkWindowState new_window_state
	)
]

{ #category : #testing }
GdkEventWindowState class >> isType: aType [

	^ aType = GDK_WINDOW_STATE
]

{ #category : #'accessing structure variables' }
GdkEventWindowState >> changed_mask [
	"This method was automatically generated"
	^GdkWindowState fromInteger: (handle unsignedLongAt: OFFSET_CHANGED_MASK)
]

{ #category : #'accessing structure variables' }
GdkEventWindowState >> changed_mask: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_CHANGED_MASK put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventWindowState >> new_window_state [
	"This method was automatically generated"
	^GdkWindowState fromInteger: (handle unsignedLongAt: OFFSET_NEW_WINDOW_STATE)
]

{ #category : #'accessing structure variables' }
GdkEventWindowState >> new_window_state: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_NEW_WINDOW_STATE put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventWindowState >> send_event [
	"This method was automatically generated"
	^handle signedByteAt: OFFSET_SEND_EVENT
]

{ #category : #'accessing structure variables' }
GdkEventWindowState >> send_event: anObject [
	"This method was automatically generated"
	handle signedByteAt: OFFSET_SEND_EVENT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventWindowState >> type [
	"This method was automatically generated"
	^GdkEventType fromInteger: (handle signedLongAt: OFFSET_TYPE)
]

{ #category : #'accessing structure variables' }
GdkEventWindowState >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventWindowState >> window [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_WINDOW) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventWindowState >> window: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_WINDOW put: anObject getHandle.
]
