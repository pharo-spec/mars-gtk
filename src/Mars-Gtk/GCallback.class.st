Class {
	#name : #GCallback,
	#superclass : #FFICallback,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #evaluating }
GCallback >> valueWithArguments: args [

	GtkRunLoop current callbackEnter.	
	^ super valueWithArguments: args
]
