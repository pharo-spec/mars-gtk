Class {
	#name : #GtkTargetEntry,
	#superclass : #GtkStructure,
	#classVars : [
		'OFFSET_FLAGS',
		'OFFSET_INFO',
		'OFFSET_TARGET'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'field definition' }
GtkTargetEntry class >> fieldsDesc [  
	^ #(
	 gchar *target;
    guint  flags;
    guint  info;
)
]

{ #category : #'accessing structure variables' }
GtkTargetEntry >> flags [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_FLAGS
]

{ #category : #'accessing structure variables' }
GtkTargetEntry >> flags: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : #'accessing structure variables' }
GtkTargetEntry >> info [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_INFO
]

{ #category : #'accessing structure variables' }
GtkTargetEntry >> info: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_INFO put: anObject
]

{ #category : #'accessing structure variables' }
GtkTargetEntry >> target [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TARGET) type: ExternalType char asPointerType
]

{ #category : #'accessing structure variables' }
GtkTargetEntry >> target: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TARGET put: anObject getHandle.
]
