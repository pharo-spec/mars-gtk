Class {
	#name : #GdkEventKeyPress,
	#superclass : #GdkEventKey,
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #testing }
GdkEventKeyPress class >> isType: aType [

	^ aType = GDK_KEY_PRESS
]
