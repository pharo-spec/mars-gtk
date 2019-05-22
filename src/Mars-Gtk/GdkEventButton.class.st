"
Used for button press and button release events.

https://developer.gnome.org/gdk3/stable/gdk3-Event-Structures.html#GdkEventButton
"
Class {
	#name : #GdkEventButton,
	#superclass : #GdkEvent,
	#classVars : [
		'OFFSET_AXES',
		'OFFSET_BUTTON',
		'OFFSET_DEVICE',
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
	#pools : [
		'GdkButtonType'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #'field definition' }
GdkEventButton class >> fieldsDesc [ 
	"self rebuildFieldAccessors"
	
	^ #(
  GdkEventType type;
  "GdkWindow *" void *window;
  gint8 send_event;
  guint32 time;
  gdouble x;
  gdouble y;
  gdouble *axes;
  guint state;
  guint button;
  "GdkDevice *" void *device;
  gdouble x_root;
  gdouble y_root;
	)
]

{ #category : #'instance creation' }
GdkEventButton class >> newButtonPress [

	^ self newType: GDK_BUTTON_PRESS
]

{ #category : #'instance creation' }
GdkEventButton class >> newButtonRelease [

	^ self newType: GDK_BUTTON_RELEASE
]

{ #category : #'instance creation' }
GdkEventButton class >> newRightClick [

	^ (self newType: GDK_BUTTON_PRESS)
		button: GDK_BUTTON_SECONDARY;
		yourself		
]

{ #category : #'accessing structure variables' }
GdkEventButton >> axes [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_AXES) type: ExternalType double asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventButton >> axes: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_AXES put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GdkEventButton >> button [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_BUTTON
]

{ #category : #'accessing structure variables' }
GdkEventButton >> button: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_BUTTON put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventButton >> device [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DEVICE) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventButton >> device: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DEVICE put: anObject getHandle.
]

{ #category : #testing }
GdkEventButton >> isDoubleClick [ 

	^ self type = GDK_2BUTTON_PRESS
]

{ #category : #testing }
GdkEventButton >> isEventButton [

	^ true
]

{ #category : #testing }
GdkEventButton >> isMiddleButton [

	^ self button = GDK_BUTTON_MIDDLE
]

{ #category : #testing }
GdkEventButton >> isPrimaryButton [

	^ self button = GDK_BUTTON_PRIMARY
]

{ #category : #testing }
GdkEventButton >> isSecondaryButton [

	^ self button = GDK_BUTTON_SECONDARY
]

{ #category : #accessing }
GdkEventButton >> position [

	^ self x @ self y
]

{ #category : #'accessing structure variables' }
GdkEventButton >> send_event [
	"This method was automatically generated"
	^handle signedByteAt: OFFSET_SEND_EVENT
]

{ #category : #'accessing structure variables' }
GdkEventButton >> send_event: anObject [
	"This method was automatically generated"
	handle signedByteAt: OFFSET_SEND_EVENT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventButton >> state [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_STATE
]

{ #category : #'accessing structure variables' }
GdkEventButton >> state: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STATE put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventButton >> time [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIME
]

{ #category : #'accessing structure variables' }
GdkEventButton >> time: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIME put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventButton >> type [
	"This method was automatically generated"
	^GdkEventType fromInteger: (handle signedLongAt: OFFSET_TYPE)
]

{ #category : #'accessing structure variables' }
GdkEventButton >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventButton >> window [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_WINDOW) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventButton >> window: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_WINDOW put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GdkEventButton >> x [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
GdkEventButton >> x: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventButton >> x_root [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X_ROOT
]

{ #category : #'accessing structure variables' }
GdkEventButton >> x_root: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X_ROOT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventButton >> y [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
GdkEventButton >> y: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventButton >> y_root [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y_ROOT
]

{ #category : #'accessing structure variables' }
GdkEventButton >> y_root: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y_ROOT put: anObject
]
