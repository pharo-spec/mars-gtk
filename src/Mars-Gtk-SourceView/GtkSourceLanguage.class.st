"
GtkSourceLanguage — Represents a syntax highlighted language

https://developer.gnome.org/gtksourceview/unstable/GtkSourceLanguage.html
"
Class {
	#name : #GtkSourceLanguage,
	#superclass : #GObject,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #accessing }
GtkSourceLanguage class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_source_language_get_type())
]

{ #category : #'instance creation' }
GtkSourceLanguage class >> new [

	self error: 'This can''t be made. You need to access languages through GtkSourceLanguageManager'
]
