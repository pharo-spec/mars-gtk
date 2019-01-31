Class {
	#name : #GdkEvent,
	#superclass : #GtkStructure,
	#pools : [
		'GdkEventType'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #testing }
GdkEvent >> isDoubleClick [ 

	^ self type = GDK_2BUTTON_PRESS
	
]
