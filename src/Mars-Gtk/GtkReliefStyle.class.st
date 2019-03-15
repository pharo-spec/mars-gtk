"
enum GtkReliefStyle
Indicated the relief to be drawn around a GtkButton.

https://developer.gnome.org/gtk3/stable/gtk3-Standard-Enumerations.html#GtkReliefStyle
"
Class {
	#name : #GtkReliefStyle,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_RELIEF_NONE',
		'GTK_RELIEF_NORMAL'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkReliefStyle class >> GTK_RELIEF_NONE [
	"This method was automatically generated"
	^ GTK_RELIEF_NONE
]

{ #category : #'accessing enum' }
GtkReliefStyle class >> GTK_RELIEF_NORMAL [
	"This method was automatically generated"
	^ GTK_RELIEF_NORMAL
]

{ #category : #'enum declaration' }
GtkReliefStyle class >> enumDecl [
	^ #(
	GTK_RELIEF_NORMAL 	0
  	GTK_RELIEF_NONE 	1
	)
]
