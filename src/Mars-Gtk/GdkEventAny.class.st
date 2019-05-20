"
struct GdkEventAny

Contains the fields which are common to all event structs. Any event pointer can safely be cast to a pointer to a GdkEventAny to access these fields.

https://developer.gnome.org/gdk3/stable/gdk3-Event-Structures.html#GdkEventAny
"
Class {
	#name : #GdkEventAny,
	#superclass : #GdkEvent,
	#classVars : [
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
GdkEventAny class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
  GdkEventType type;
  "GdkWindow *" void *window;
  gint8 send_event;	
	)
]

{ #category : #visiting }
GdkEventAny >> accept: aVisitor [
	"do nothing"
]

{ #category : #testing }
GdkEventAny >> isAnyType [

	^ true
]

{ #category : #'accessing structure variables' }
GdkEventAny >> send_event [
	"This method was automatically generated"
	^handle signedByteAt: OFFSET_SEND_EVENT
]

{ #category : #'accessing structure variables' }
GdkEventAny >> send_event: anObject [
	"This method was automatically generated"
	handle signedByteAt: OFFSET_SEND_EVENT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventAny >> type [
	"This method was automatically generated"
	^GdkEventType fromInteger: (handle signedLongAt: OFFSET_TYPE)
]

{ #category : #'accessing structure variables' }
GdkEventAny >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventAny >> window [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_WINDOW) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventAny >> window: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_WINDOW put: anObject getHandle.
]
