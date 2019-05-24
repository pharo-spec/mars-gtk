"
Generated when a window size or position has changed.

https://developer.gnome.org/gdk3/stable/gdk3-Event-Structures.html#GdkEventConfigure
"
Class {
	#name : #GdkEventConfigure,
	#superclass : #GdkEvent,
	#classVars : [
		'OFFSET_HEIGHT',
		'OFFSET_SEND_EVENT',
		'OFFSET_TYPE',
		'OFFSET_WIDTH',
		'OFFSET_WINDOW',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#pools : [
		'GdkEventType'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #'field definition' }
GdkEventConfigure class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
  GdkEventType type;
  "GdkWindow *"void *window;
  gint8 send_event;
  gint x;
  gint y;
  gint width;
  gint height;	
	)
]

{ #category : #testing }
GdkEventConfigure class >> isType: aType [

	^ aType = GDK_CONFIGURE
]

{ #category : #visiting }
GdkEventConfigure >> accept: aVisitor [
	
	"do nothing"
]

{ #category : #accessing }
GdkEventConfigure >> extent [

	^ self width@self height
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> height [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEIGHT
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> height: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : #testing }
GdkEventConfigure >> isEventConfigure [

	^ true
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> send_event [
	"This method was automatically generated"
	^handle signedByteAt: OFFSET_SEND_EVENT
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> send_event: anObject [
	"This method was automatically generated"
	handle signedByteAt: OFFSET_SEND_EVENT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> type [
	"This method was automatically generated"
	^GdkEventType fromInteger: (handle signedLongAt: OFFSET_TYPE)
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> width [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTH
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> width: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTH put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> window [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_WINDOW) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> window: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_WINDOW put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
GdkEventConfigure >> y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]
