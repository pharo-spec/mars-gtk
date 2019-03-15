"
enum GdkGravity

Defines the reference point of a window and the meaning of coordinates passed to gtk_window_move(). See gtk_window_move() and the ""implementation notes"" section of the Extended Window Manager Hints specification for more details.

https://developer.gnome.org/gdk3/stable/gdk3-Windows.html#GdkGravity
"
Class {
	#name : #GdkGravity,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GDK_GRAVITY_CENTER',
		'GDK_GRAVITY_EAST',
		'GDK_GRAVITY_NORTH',
		'GDK_GRAVITY_NORTH_EAST',
		'GDK_GRAVITY_NORTH_WEST',
		'GDK_GRAVITY_SOUTH',
		'GDK_GRAVITY_SOUTH_EAST',
		'GDK_GRAVITY_SOUTH_WEST',
		'GDK_GRAVITY_STATIC',
		'GDK_GRAVITY_WEST'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'accessing enum' }
GdkGravity class >> GDK_GRAVITY_CENTER [
	"This method was automatically generated"
	^ GDK_GRAVITY_CENTER
]

{ #category : #'accessing enum' }
GdkGravity class >> GDK_GRAVITY_EAST [
	"This method was automatically generated"
	^ GDK_GRAVITY_EAST
]

{ #category : #'accessing enum' }
GdkGravity class >> GDK_GRAVITY_NORTH [
	"This method was automatically generated"
	^ GDK_GRAVITY_NORTH
]

{ #category : #'accessing enum' }
GdkGravity class >> GDK_GRAVITY_NORTH_EAST [
	"This method was automatically generated"
	^ GDK_GRAVITY_NORTH_EAST
]

{ #category : #'accessing enum' }
GdkGravity class >> GDK_GRAVITY_NORTH_WEST [
	"This method was automatically generated"
	^ GDK_GRAVITY_NORTH_WEST
]

{ #category : #'accessing enum' }
GdkGravity class >> GDK_GRAVITY_SOUTH [
	"This method was automatically generated"
	^ GDK_GRAVITY_SOUTH
]

{ #category : #'accessing enum' }
GdkGravity class >> GDK_GRAVITY_SOUTH_EAST [
	"This method was automatically generated"
	^ GDK_GRAVITY_SOUTH_EAST
]

{ #category : #'accessing enum' }
GdkGravity class >> GDK_GRAVITY_SOUTH_WEST [
	"This method was automatically generated"
	^ GDK_GRAVITY_SOUTH_WEST
]

{ #category : #'accessing enum' }
GdkGravity class >> GDK_GRAVITY_STATIC [
	"This method was automatically generated"
	^ GDK_GRAVITY_STATIC
]

{ #category : #'accessing enum' }
GdkGravity class >> GDK_GRAVITY_WEST [
	"This method was automatically generated"
	^ GDK_GRAVITY_WEST
]

{ #category : #'enum declaration' }
GdkGravity class >> enumDecl [ 

	^ #(
  GDK_GRAVITY_NORTH_WEST 	1
  GDK_GRAVITY_NORTH 			2
  GDK_GRAVITY_NORTH_EAST 	3
  GDK_GRAVITY_WEST 			4
  GDK_GRAVITY_CENTER 			5
  GDK_GRAVITY_EAST 			6
  GDK_GRAVITY_SOUTH_WEST 	7
  GDK_GRAVITY_SOUTH 			8
  GDK_GRAVITY_SOUTH_EAST 	9
  GDK_GRAVITY_STATIC			10
	)
]
