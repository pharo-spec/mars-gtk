"
Represents the orientation of widgets and other objects which can be switched between horizontal and vertical orientation on the fly, like GtkToolbar or GtkGesturePan.

https://developer.gnome.org/gtk3/stable/gtk3-Standard-Enumerations.html#GtkOrientation
"
Class {
	#name : #GtkOrientation,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_ORIENTATION_HORIZONTAL',
		'GTK_ORIENTATION_VERTICAL'
	],
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #'enum declaration' }
GtkOrientation class >> enumDecl [
	^ #(
	GTK_ORIENTATION_HORIZONTAL 	0
	GTK_ORIENTATION_VERTICAL		1
	)
]
