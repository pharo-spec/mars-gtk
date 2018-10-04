Class {
	#name : #GTypeInterface,
	#superclass : #FFIExternalStructure,
	#pools : [
		'GtkTypes'
	],
	#category : 'Mars-Gtk-Misc'
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
	^handle unsignedLongAt: 5
]

{ #category : #'accessing structure variables' }
GTypeInterface >> g_instance_type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: 5 put: anObject
]

{ #category : #'accessing structure variables' }
GTypeInterface >> g_type [
	"This method was automatically generated"
	^handle unsignedLongAt: 1
]

{ #category : #'accessing structure variables' }
GTypeInterface >> g_type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: 1 put: anObject
]
