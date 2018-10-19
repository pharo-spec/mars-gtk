"
enum GtkArrowType
Used to indicate the direction in which an arrow should point.

https://developer.gnome.org/gtk3/unstable/GtkMenuButton.html#GtkArrowType
"
Class {
	#name : #GtkArrowType,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_ARROW_DOWN',
		'GTK_ARROW_LEFT',
		'GTK_ARROW_NONE',
		'GTK_ARROW_RIGHT',
		'GTK_ARROW_UP',
		'GTK_POS_BOTTOM',
		'GTK_POS_LEFT',
		'GTK_POS_RIGHT',
		'GTK_POS_TOP'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'enum declaration' }
GtkArrowType class >> enumDecl [
	^ #(
		GTK_ARROW_UP    0 "Represents an upward pointing arrow."
		GTK_ARROW_DOWN  1 "Represents a downward pointing arrow."
		GTK_ARROW_LEFT  2 "Represents a left pointing arrow."
		GTK_ARROW_RIGHT 3 "Represents a right pointing arrow."
		GTK_ARROW_NONE  4 "No arrow. Since 2.10."
	)
]
