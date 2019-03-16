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

{ #category : #'accessing enum' }
GtkOrientation class >> GTK_ORIENTATION_HORIZONTAL [
	"This method was automatically generated"
	^ GTK_ORIENTATION_HORIZONTAL
]

{ #category : #'accessing enum' }
GtkOrientation class >> GTK_ORIENTATION_VERTICAL [
	"This method was automatically generated"
	^ GTK_ORIENTATION_VERTICAL
]

{ #category : #'enum declaration' }
GtkOrientation class >> enumDecl [
	^ #(
	GTK_ORIENTATION_HORIZONTAL 	0
	GTK_ORIENTATION_VERTICAL		1
	)
]
