"
enum GtkWrapMode
Describes a type of line wrapping.

https://developer.gnome.org/gtk3/stable/GtkTextView.html#GtkWrapMode
"
Class {
	#name : #GtkWrapMode,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_WRAP_CHAR',
		'GTK_WRAP_NONE',
		'GTK_WRAP_WORD',
		'GTK_WRAP_WORD_CHAR'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkWrapMode class >> GTK_WRAP_CHAR [
	"This method was automatically generated"
	^ GTK_WRAP_CHAR
]

{ #category : #'accessing enum' }
GtkWrapMode class >> GTK_WRAP_NONE [
	"This method was automatically generated"
	^ GTK_WRAP_NONE
]

{ #category : #'accessing enum' }
GtkWrapMode class >> GTK_WRAP_WORD [
	"This method was automatically generated"
	^ GTK_WRAP_WORD
]

{ #category : #'accessing enum' }
GtkWrapMode class >> GTK_WRAP_WORD_CHAR [
	"This method was automatically generated"
	^ GTK_WRAP_WORD_CHAR
]

{ #category : #'enum declaration' }
GtkWrapMode class >> enumDecl [

	^ #(
	GTK_WRAP_NONE 			0
	GTK_WRAP_CHAR 			1
	GTK_WRAP_WORD 			2
	GTK_WRAP_WORD_CHAR 	3
	)
]
