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

{ #category : #accessing }
GtkTextMark class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_text_mark_get_type())
]

{ #category : #'instance creation' }
GtkTextMark class >> newName: aString [

	^ self textMarkNewName: aString leftGravity: true
]

{ #category : #private }
GtkTextMark class >> textMarkNewName: aName leftGravity: left_gravity [

	^ self ffiCall: #(GtkTextMark *gtk_text_mark_new (const gchar *aName, gboolean left_gravity))
]

{ #category : #accessing }
GtkTextMark >> name [ 

	^ self ffiCall: #(const gchar *gtk_text_mark_get_name (self))
]
