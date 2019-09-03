Class {
	#name : #GInterface,
	#superclass : #GtkStructure,
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #'field definition' }
GInterface class >> fieldsDesc [

	^ #(
	GTypeInterface g_iface;
	)
]
