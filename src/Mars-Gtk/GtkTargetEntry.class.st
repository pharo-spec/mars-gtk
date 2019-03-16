"
https://www.cs.tut.fi/lintula/manual/gtk/gtk/gtk-selections.html#GTKTARGETENTRY
A GtkTargetEntry structure represents a single type of data than can be supplied for by a widget for a selection or for supplied or received during drag-and-drop. It contains a string representing the drag type, a flags field (used only for drag and drop - see GtkTargetFlags), and an application assigned integer ID. The integer ID will later be passed as a signal parameter for signals like ""selection_get"". It allows the application to identify the target type without extensive string compares.


"
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
