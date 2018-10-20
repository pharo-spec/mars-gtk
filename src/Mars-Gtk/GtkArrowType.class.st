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
		'GTK_ARROW_UP'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkArrowType class >> GTK_ARROW_DOWN [
	"This method was automatically generated"
	^ GTK_ARROW_DOWN
]

{ #category : #'accessing enum' }
GtkArrowType class >> GTK_ARROW_LEFT [
	"This method was automatically generated"
	^ GTK_ARROW_LEFT
]

{ #category : #'accessing enum' }
GtkArrowType class >> GTK_ARROW_NONE [
	"This method was automatically generated"
	^ GTK_ARROW_NONE
]

{ #category : #'accessing enum' }
GtkArrowType class >> GTK_ARROW_RIGHT [
	"This method was automatically generated"
	^ GTK_ARROW_RIGHT
]

{ #category : #'accessing enum' }
GtkArrowType class >> GTK_ARROW_UP [
	"This method was automatically generated"
	^ GTK_ARROW_UP
]

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
