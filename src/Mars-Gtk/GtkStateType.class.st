"
This type indicates the current state of a widget; the state determines how the widget is drawn. The GtkStateType enumeration is also used to identify different colors in a GtkStyle for drawing, so states can be used for subparts of a widget as well as entire widgets.

https://developer.gnome.org/gtk2/stable/gtk2-Standard-Enumerations.html#GtkStateType
"
Class {
	#name : #GtkStateType,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'GTK_STATE_ACTIVE',
		'GTK_STATE_FOCUSED',
		'GTK_STATE_INCONSISTENT',
		'GTK_STATE_INSENSITIVE',
		'GTK_STATE_NORMAL',
		'GTK_STATE_PRELIGHT',
		'GTK_STATE_SELECTED'
	],
	#category : 'Mars-Gtk-Widget'
}

{ #category : #'enum declaration' }
GtkStateType class >> enumDecl [
	^ #(
  GTK_STATE_NORMAL 			0
  GTK_STATE_ACTIVE 			1
  GTK_STATE_PRELIGHT 			2
  GTK_STATE_SELECTED 			3
  GTK_STATE_INSENSITIVE 		4
  GTK_STATE_INCONSISTENT 	5
  GTK_STATE_FOCUSED	 		6
	)
]
