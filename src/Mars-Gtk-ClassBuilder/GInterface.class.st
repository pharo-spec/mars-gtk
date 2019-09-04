Class {
	#name : #GInterface,
	#superclass : #GtkStructure,
	#category : #'Mars-Gtk-ClassBuilder'
}

{ #category : #'field definition' }
GInterface class >> fieldsDesc [

	^ #(
	GTypeInterface g_iface;
	)
]
