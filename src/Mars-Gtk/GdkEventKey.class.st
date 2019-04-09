"
Describes a key press or key release event.

https://developer.gnome.org/gdk3/stable/gdk3-Event-Structures.html#GdkEventKey
"
Class {
	#name : #GdkEventKey,
	#superclass : #GdkEvent,
	#instVars : [
		'keyValue'
	],
	#classVars : [
		'OFFSET_GROUP',
		'OFFSET_HARDWARE_KEYCODE',
		'OFFSET_IS_MODIFIER',
		'OFFSET_KEYVAL',
		'OFFSET_LENGTH',
		'OFFSET_SEND_EVENT',
		'OFFSET_STATE',
		'OFFSET_STRING',
		'OFFSET_TIME',
		'OFFSET_TYPE',
		'OFFSET_WINDOW'
	],
	#pools : [
		'GdkKeyCodes',
		'GdkModifierType'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #'field definition' }
GdkEventKey class >> fieldsDesc [ 
	"self rebuildFieldAccessors"
	
	^ #(
  GdkEventType type;
  "GdkWindow *"void *window;
  gint8 send_event;
  guint32 time;
  guint state;
  guint keyval;
  gint length;
  gchar *string;
  guint16 hardware_keycode;
  guint8 group;
  guint is_modifier	
	)
]

{ #category : #'accessing structure variables' }
GdkEventKey >> group [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_GROUP
]

{ #category : #'accessing structure variables' }
GdkEventKey >> group: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_GROUP put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventKey >> hardware_keycode [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_HARDWARE_KEYCODE
]

{ #category : #'accessing structure variables' }
GdkEventKey >> hardware_keycode: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_HARDWARE_KEYCODE put: anObject
]

{ #category : #testing }
GdkEventKey >> hasAltModifier [

	^ self hasMod1
]

{ #category : #testing }
GdkEventKey >> hasAnyModifier [

	^ self state ~= 0
]

{ #category : #testing }
GdkEventKey >> hasControlModifier [

	^ self hasModifier: GDK_CONTROL_MASK
]

{ #category : #testing }
GdkEventKey >> hasLockModifier [

	^ self hasModifier: GDK_LOCK_MASK	
]

{ #category : #testing }
GdkEventKey >> hasMetaModifier [

	^ self hasModifier: GDK_META_MASK
]

{ #category : #testing }
GdkEventKey >> hasMod1 [

	^ self hasModifier: GDK_MOD1_MASK
]

{ #category : #testing }
GdkEventKey >> hasModifier: aModifier [

	^ (self state & (aModifier value)) = aModifier value
]

{ #category : #testing }
GdkEventKey >> hasShiftModifier [

	^ self hasModifier: GDK_SHIFT_MASK
]

{ #category : #testing }
GdkEventKey >> isEscape [

	^ self keyValue = KEY_Escape
]

{ #category : #testing }
GdkEventKey >> isKeyDown [

	^ self keyValue = KEY_Down
]

{ #category : #testing }
GdkEventKey >> isKeyUp [

	^ self keyValue = KEY_Up
]

{ #category : #'accessing structure variables' }
GdkEventKey >> is_modifier [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_IS_MODIFIER
]

{ #category : #'accessing structure variables' }
GdkEventKey >> is_modifier: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_IS_MODIFIER put: anObject
]

{ #category : #private }
GdkEventKey >> keyValue [

	^ keyValue ifNil: [ keyValue := self keyval ]
]

{ #category : #'accessing structure variables' }
GdkEventKey >> keyval [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_KEYVAL
]

{ #category : #'accessing structure variables' }
GdkEventKey >> keyval: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_KEYVAL put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventKey >> length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LENGTH
]

{ #category : #'accessing structure variables' }
GdkEventKey >> length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventKey >> send_event [
	"This method was automatically generated"
	^handle signedByteAt: OFFSET_SEND_EVENT
]

{ #category : #'accessing structure variables' }
GdkEventKey >> send_event: anObject [
	"This method was automatically generated"
	handle signedByteAt: OFFSET_SEND_EVENT put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventKey >> state [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_STATE
]

{ #category : #'accessing structure variables' }
GdkEventKey >> state: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_STATE put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventKey >> string [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_STRING) type: ExternalType char asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventKey >> string: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_STRING put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GdkEventKey >> time [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIME
]

{ #category : #'accessing structure variables' }
GdkEventKey >> time: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIME put: anObject
]

{ #category : #'accessing structure variables' }
GdkEventKey >> type [
	"This method was automatically generated"
	^GdkEventType fromInteger: (handle signedLongAt: OFFSET_TYPE)
]

{ #category : #'accessing structure variables' }
GdkEventKey >> type: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TYPE put: anObject value
]

{ #category : #'accessing structure variables' }
GdkEventKey >> window [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_WINDOW) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GdkEventKey >> window: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_WINDOW put: anObject getHandle.
]
