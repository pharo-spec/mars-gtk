"
struct GdkEventMotion

Generated when the pointer moves.
"
Class {
	#name : #GdkEventMotion,
	#superclass : #GdkEvent,
	#classVars : [
		'OFFSET_AXES',
		'OFFSET_DEVICE',
		'OFFSET_IS_HINT',
		'OFFSET_SEND_EVENT',
		'OFFSET_STATE',
		'OFFSET_TIME',
		'OFFSET_TYPE',
		'OFFSET_WINDOW',
		'OFFSET_X',
		'OFFSET_X_ROOT',
		'OFFSET_Y',
		'OFFSET_Y_ROOT'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #'field definition' }
GdkEventMotion class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
  GdkEventType type;
  "GdkWindow *"void *window;
  gint8 send_event;
  guint32 time;
  gdouble x;
  gdouble y;
  gdouble *axes;
  guint state;
  gint16 is_hint;
  "GdkDevice *"void *device;
  gdouble x_root;
  gdouble y_root; 
	)
]

{ #category : #testing }
GdkEventMotion class >> isType: aType [

	^ aType = GDK_MOTION_NOTIFY
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> axes [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_AXES) type: ExternalType double asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> axes: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_AXES put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> device [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DEVICE) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> device: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DEVICE put: anObject getHandle.
]

{ #category : #testing }
GdkEventMotion >> isEventMotion [

	^ true
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> is_hint [
	"This method was automatically generated"
	^handle signedShortAt: OFFSET_IS_HINT
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> is_hint: anObject [
	"This method was automatically generated"
	handle signedShortAt: OFFSET_IS_HINT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> send_event [
	"This method was automatically generated"
	^handle signedByteAt: OFFSET_SEND_EVENT
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> send_event: anObject [
	"This method was automatically generated"
	handle signedByteAt: OFFSET_SEND_EVENT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> state [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_STATE
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> state: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STATE put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> time [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIME
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> time: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIME put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> type [
	"This method was automatically generated"
	^GdkEventType fromInteger: (handle signedLongAt: OFFSET_TYPE)
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> window [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_WINDOW) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> window: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_WINDOW put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> x [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> x: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> x_root [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X_ROOT
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> x_root: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X_ROOT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> y [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> y: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> y_root [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y_ROOT
]

{ #category : #'accessing structure variables' }
GdkEventMotion >> y_root: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y_ROOT put: anObject
]
