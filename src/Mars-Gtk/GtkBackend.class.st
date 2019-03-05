Class {
	#name : #GtkBackend,
	#superclass : #ApplicationBackend,
	#category : #'Mars-Gtk-Backend'
}

{ #category : #accessing }
GtkBackend class >> backendName [

	^ #Gtk
]

{ #category : #private }
GtkBackend >> adapterBindingsClass [

	^ GtkAdapterBindings
]
