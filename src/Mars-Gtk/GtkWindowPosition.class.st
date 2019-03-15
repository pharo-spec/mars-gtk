"
Window placement can be influenced using this enumeration. Note that using GTK_WIN_POS_CENTER_ALWAYS is almost always a bad idea. It won’t necessarily work well with all window managers or on all windowing systems.

https://developer.gnome.org/gtk3/stable/GtkWindow.html#GtkWindowPosition
"
Class {
	#name : #GtkWindowPosition,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_WIN_POS_CENTER',
		'GTK_WIN_POS_CENTER_ALWAYS',
		'GTK_WIN_POS_CENTER_ON_PARENT',
		'GTK_WIN_POS_MOUSE',
		'GTK_WIN_POS_NONE'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #'accessing enum' }
GtkWindowPosition class >> GTK_WIN_POS_CENTER [
	"This method was automatically generated"
	^ GTK_WIN_POS_CENTER
]

{ #category : #'accessing enum' }
GtkWindowPosition class >> GTK_WIN_POS_CENTER_ALWAYS [
	"This method was automatically generated"
	^ GTK_WIN_POS_CENTER_ALWAYS
]

{ #category : #'accessing enum' }
GtkWindowPosition class >> GTK_WIN_POS_CENTER_ON_PARENT [
	"This method was automatically generated"
	^ GTK_WIN_POS_CENTER_ON_PARENT
]

{ #category : #'accessing enum' }
GtkWindowPosition class >> GTK_WIN_POS_MOUSE [
	"This method was automatically generated"
	^ GTK_WIN_POS_MOUSE
]

{ #category : #'accessing enum' }
GtkWindowPosition class >> GTK_WIN_POS_NONE [
	"This method was automatically generated"
	^ GTK_WIN_POS_NONE
]

{ #category : #'enum declaration' }
GtkWindowPosition class >> enumDecl [
	^ #(
	GTK_WIN_POS_NONE 					0
	GTK_WIN_POS_CENTER 				1
	GTK_WIN_POS_MOUSE 					2
	GTK_WIN_POS_CENTER_ALWAYS 		3
	GTK_WIN_POS_CENTER_ON_PARENT 	4)
]
