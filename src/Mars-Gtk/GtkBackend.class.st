Class {
	#name : #GtkBackend,
	#superclass : #ApplicationBackend,
	#category : #'Mars-Gtk'
}

{ #category : #accessing }
GtkBackend class >> backendName [
	
	^ #Gtk
]

{ #category : #private }
GtkBackend >> adapterBindingsClass [

	^ GtkAdapterBindings
]
