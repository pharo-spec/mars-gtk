"
I'm a base interface to be extended for real Gtk interfaces. 
My children needs to define #fieldsDesc but they can use the fieldsDesc implementation I keep as a base (since all interfaces needs to start with same field, the GTypeInterface)
"
Class {
	#name : #GInterface,
	#superclass : #GtkStructure,
	#classVars : [
		'OFFSET_G_IFACE'
	],
	#category : #'Mars-Gtk-ClassBuilder'
}

{ #category : #'field definition' }
GInterface class >> compileFields [

	self = GInterface ifTrue: [ ^ self ].	
	^ super compileFields
]

{ #category : #'field definition' }
GInterface class >> fieldsDesc [

	^ #(
	GTypeInterface g_iface;
	)
]

{ #category : #'class initialization' }
GInterface class >> initialize [

	"Offset is always 1"
	OFFSET_G_IFACE := 1
]

{ #category : #'accessing structure variables' }
GInterface >> g_iface [
	"This method was automatically generated"
	^ GTypeInterface fromHandle: (handle 
		referenceStructAt: OFFSET_G_IFACE 
		length: GTypeInterface byteSize)
]

{ #category : #'accessing structure variables' }
GInterface >> g_iface: anObject [
	"This method was automatically generated"
	handle 
		structAt: OFFSET_G_IFACE 
		put: anObject getHandle 
		length: GTypeInterface byteSize
]
