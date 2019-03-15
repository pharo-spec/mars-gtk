Class {
	#name : #GdkButtonType,
	#superclass : #SharedPool,
	#classVars : [
		'GDK_BUTTON_MIDDLE',
		'GDK_BUTTON_PRIMARY',
		'GDK_BUTTON_SECONDARY'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #'class initialization' }
GdkButtonType class >> initialize [ 

	GDK_BUTTON_PRIMARY := 1. 
	GDK_BUTTON_MIDDLE := 2. 
	GDK_BUTTON_SECONDARY := 3
]
