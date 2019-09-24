Class {
	#name : #GdkEventCrossing,
	#superclass : #GdkEvent,
	#classVars : [
		'OFFSET_DETAIL',
		'OFFSET_FOCUS',
		'OFFSET_MODE',
		'OFFSET_SEND_EVENT',
		'OFFSET_STATE',
		'OFFSET_SUBWINDOW',
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
GdkEventCrossing class >> fieldsDesc [ 
	"self rebuildFieldAccessors"
	
	^ #(
  GdkEventType type;
  "GdkWindow" void *window;
  gint8 send_event;
  "GdkWindow" void *subwindow;
  guint32 time;
  gdouble x;
  gdouble y;
  gdouble x_root;
  gdouble y_root;
  GdkCrossingMode mode;
  GdkNotifyType detail;
  gboolean focus;
  guint state;
	)
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> detail [
	"This method was automatically generated"
	^GdkNotifyType fromInteger: (handle unsignedLongAt: OFFSET_DETAIL)
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> detail: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DETAIL put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> focus [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_FOCUS
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> focus: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_FOCUS put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> mode [
	"This method was automatically generated"
	^GdkCrossingMode fromInteger: (handle unsignedLongAt: OFFSET_MODE)
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> mode: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MODE put: anObject value
]

{ #category : #accessing }
GdkEventCrossing >> position [

	^ self x @ self y
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> send_event [
	"This method was automatically generated"
	^handle signedByteAt: OFFSET_SEND_EVENT
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> send_event: anObject [
	"This method was automatically generated"
	handle signedByteAt: OFFSET_SEND_EVENT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> state [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_STATE
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> state: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STATE put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> subwindow [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SUBWINDOW) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> subwindow: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SUBWINDOW put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> time [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIME
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> time: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIME put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> type [
	"This method was automatically generated"
	^GdkEventType fromInteger: (handle signedLongAt: OFFSET_TYPE)
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> window [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_WINDOW) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> window: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_WINDOW put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> x [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> x: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> x_root [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X_ROOT
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> x_root: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X_ROOT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> y [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> y: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> y_root [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y_ROOT
]

{ #category : #'accessing structure variables' }
GdkEventCrossing >> y_root: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y_ROOT put: anObject
]
