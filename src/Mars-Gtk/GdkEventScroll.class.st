Class {
	#name : #GdkEventScroll,
	#superclass : #GdkEvent,
	#classVars : [
		'OFFSET_DELTA_X',
		'OFFSET_DELTA_Y',
		'OFFSET_DEVICE',
		'OFFSET_DIRECTION',
		'OFFSET_IS_STOP',
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
GdkEventScroll class >> fieldsDesc [ 
	"self rebuildFieldAccessors"
	
	^ #(
  GdkEventType type;
  "GdkWindow" void *window;
  gint8 send_event;
  guint32 time;
  gdouble x;
  gdouble y;
  guint state;
  GdkScrollDirection direction;
  "GdkDevice" void *device;
  gdouble x_root;
  gdouble y_root;
  gdouble delta_x;
  gdouble delta_y;
  guint is_stop;	
	)
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> delta_x [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_DELTA_X
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> delta_x: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_DELTA_X put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> delta_y [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_DELTA_Y
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> delta_y: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_DELTA_Y put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> device [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DEVICE) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> device: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DEVICE put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> direction [
	"This method was automatically generated"
	^GdkScrollDirection fromInteger: (handle unsignedLongAt: OFFSET_DIRECTION)
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> direction: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DIRECTION put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> is_stop [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_IS_STOP
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> is_stop: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_IS_STOP put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> send_event [
	"This method was automatically generated"
	^handle signedByteAt: OFFSET_SEND_EVENT
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> send_event: anObject [
	"This method was automatically generated"
	handle signedByteAt: OFFSET_SEND_EVENT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> state [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_STATE
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> state: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STATE put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> time [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIME
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> time: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIME put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> type [
	"This method was automatically generated"
	^GdkEventType fromInteger: (handle signedLongAt: OFFSET_TYPE)
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> window [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_WINDOW) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> window: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_WINDOW put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> x [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> x: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> x_root [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X_ROOT
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> x_root: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X_ROOT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> y [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> y: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> y_root [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y_ROOT
]

{ #category : #'accessing structure variables' }
GdkEventScroll >> y_root: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y_ROOT put: anObject
]
