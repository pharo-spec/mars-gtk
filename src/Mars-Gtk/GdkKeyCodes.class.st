Class {
	#name : #GdkKeyCodes,
	#superclass : #SharedPool,
	#classVars : [
		'KEY_DOWN',
		'KEY_UP'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #'class initialization' }
GdkKeyCodes class >> initialize [ 

	KEY_UP := 65362.
	KEY_DOWN := 65364
]
