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

	GCallbackVariable value: true.

	^ super valueWithArguments: args
]
