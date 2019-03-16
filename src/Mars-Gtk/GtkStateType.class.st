"
This type indicates the current state of a widget; the state determines how the widget is drawn. The GtkStateType enumeration is also used to identify different colors in a GtkStyle for drawing, so states can be used for subparts of a widget as well as entire widgets.

https://developer.gnome.org/gtk2/stable/gtk2-Standard-Enumerations.html#GtkStateType
"
Class {
	#name : #GtkStateType,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_STATE_ACTIVE',
		'GTK_STATE_FOCUSED',
		'GTK_STATE_INCONSISTENT',
		'GTK_STATE_INSENSITIVE',
		'GTK_STATE_NORMAL',
		'GTK_STATE_PRELIGHT',
		'GTK_STATE_SELECTED'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkStateType class >> GTK_STATE_ACTIVE [
	"This method was automatically generated"
	^ GTK_STATE_ACTIVE
]

{ #category : #'accessing enum' }
GtkStateType class >> GTK_STATE_FOCUSED [
	"This method was automatically generated"
	^ GTK_STATE_FOCUSED
]

{ #category : #'accessing enum' }
GtkStateType class >> GTK_STATE_INCONSISTENT [
	"This method was automatically generated"
	^ GTK_STATE_INCONSISTENT
]

{ #category : #'accessing enum' }
GtkStateType class >> GTK_STATE_INSENSITIVE [
	"This method was automatically generated"
	^ GTK_STATE_INSENSITIVE
]

{ #category : #'accessing enum' }
GtkStateType class >> GTK_STATE_NORMAL [
	"This method was automatically generated"
	^ GTK_STATE_NORMAL
]

{ #category : #'accessing enum' }
GtkStateType class >> GTK_STATE_PRELIGHT [
	"This method was automatically generated"
	^ GTK_STATE_PRELIGHT
]

{ #category : #'accessing enum' }
GtkStateType class >> GTK_STATE_SELECTED [
	"This method was automatically generated"
	^ GTK_STATE_SELECTED
]

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
