Class {
	#name : #GTypeInterface,
	#superclass : #GtkStructure,
	#classVars : [
		'OFFSET_G_INSTANCE_TYPE',
		'OFFSET_G_TYPE'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'field definition' }
GTypeInterface class >> fieldsDesc [
	^ #(  
	GType g_type;
  	GType g_instance_type;
	)	
]

{ #category : #'accessing structure variables' }
GTypeInterface >> g_instance_type [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_G_INSTANCE_TYPE
]

{ #category : #'accessing structure variables' }
GTypeInterface >> g_instance_type: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_G_INSTANCE_TYPE put: anObject
]

{ #category : #'accessing structure variables' }
GTypeInterface >> g_type [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_G_TYPE
]

{ #category : #'accessing structure variables' }
GTypeInterface >> g_type: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_G_TYPE put: anObject
]
