"
enum GtkButtonBoxStyle
Used to dictate the style that a GtkButtonBox uses to layout the buttons it contains.

https://developer.gnome.org/gtk3/stable/GtkButtonBox.html#GtkButtonBoxStyle
"
Class {
	#name : #GtkButtonBoxStyle,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_BUTTONBOX_CENTER',
		'GTK_BUTTONBOX_EDGE',
		'GTK_BUTTONBOX_END',
		'GTK_BUTTONBOX_EXPAND',
		'GTK_BUTTONBOX_SPREAD',
		'GTK_BUTTONBOX_START'
	],
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #'accessing enum' }
GtkButtonBoxStyle class >> GTK_BUTTONBOX_CENTER [
	"This method was automatically generated"
	^ GTK_BUTTONBOX_CENTER
]

{ #category : #'accessing enum' }
GtkButtonBoxStyle class >> GTK_BUTTONBOX_EDGE [
	"This method was automatically generated"
	^ GTK_BUTTONBOX_EDGE
]

{ #category : #'accessing enum' }
GtkButtonBoxStyle class >> GTK_BUTTONBOX_END [
	"This method was automatically generated"
	^ GTK_BUTTONBOX_END
]

{ #category : #'accessing enum' }
GtkButtonBoxStyle class >> GTK_BUTTONBOX_EXPAND [
	"This method was automatically generated"
	^ GTK_BUTTONBOX_EXPAND
]

{ #category : #'accessing enum' }
GtkButtonBoxStyle class >> GTK_BUTTONBOX_SPREAD [
	"This method was automatically generated"
	^ GTK_BUTTONBOX_SPREAD
]

{ #category : #'accessing enum' }
GtkButtonBoxStyle class >> GTK_BUTTONBOX_START [
	"This method was automatically generated"
	^ GTK_BUTTONBOX_START
]

{ #category : #'enum declaration' }
GtkButtonBoxStyle class >> enumDecl [

	^ #(
	GTK_BUTTONBOX_SPREAD   1
	GTK_BUTTONBOX_EDGE     2
	GTK_BUTTONBOX_START    3
	GTK_BUTTONBOX_END      4
	GTK_BUTTONBOX_CENTER   5
	GTK_BUTTONBOX_EXPAND   6
	)
]
