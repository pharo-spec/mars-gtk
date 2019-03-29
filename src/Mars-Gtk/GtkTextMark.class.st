"
GtkTextMark — A position in the buffer preserved across buffer modifications

https://developer.gnome.org/gtk3/stable/GtkTextMark.html
"
Class {
	#name : #GtkTextMark,
	#superclass : #GObject,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'instance creation' }
GtkTextMark class >> newName: aString [

	^ self textMarkNewName: aString leftGravity: true
]

{ #category : #private }
GtkTextMark class >> textMarkNewName: aName leftGravity: left_gravity [

	^ self ffiCall: #(GtkTextMark *gtk_text_mark_new (const gchar *aName, gboolean left_gravity))
]
