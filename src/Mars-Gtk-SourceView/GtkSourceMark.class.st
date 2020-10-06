"
GtkSourceMark — Mark object for GtkSourceBuffer

https://developer.gnome.org/gtksourceview/stable/GtkSourceMark.html
"
Class {
	#name : #GtkSourceMark,
	#superclass : #GtkTextMark,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #'instance creation' }
GtkSourceMark class >> newName: aName category: aCategory [

	^ (self sourceMarkNewName: aName category: aCategory) initialize
]

{ #category : #private }
GtkSourceMark class >> sourceMarkNewName: aName category: aCategory [

	^ self 
		ffiCall: #(GtkSourceMark *gtk_source_mark_new (const gchar *aName, const gchar *aCategory)) 
		module: GtkSourceViewLibrary
]
