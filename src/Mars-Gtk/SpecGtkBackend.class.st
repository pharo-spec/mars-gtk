Class {
	#name : #SpecGtkBackend,
	#superclass : #SpecApplicationBackend,
	#category : #'Mars-Gtk-Backend'
}

{ #category : #accessing }
SpecGtkBackend class >> backendName [
	
	^ #Gtk
]

{ #category : #private }
SpecGtkBackend >> adapterBindingsClass [

	^ GtkAdapterBindings
]

{ #category : #initialization }
SpecGtkBackend >> initialize [ 
	
	GtkApplication ensureRunning.	
	super initialize.

]
