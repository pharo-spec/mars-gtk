"
I'm a base interface to be extended for real Gtk interfaces. 
My children needs to define #fieldsDesc but they can use the fieldsDesc implementation I keep as a base (since all interfaces needs to start with same field, the GTypeInterface)
"
Class {
	#name : #GInterface,
	#superclass : #GtkStructure,
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
