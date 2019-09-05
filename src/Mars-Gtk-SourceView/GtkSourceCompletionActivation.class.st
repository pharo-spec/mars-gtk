"
enum GtkSourceCompletionActivation

https://developer.gnome.org/gtksourceview/stable/GtkSourceCompletionContext.html#GtkSourceCompletionActivation
"
Class {
	#name : #GtkSourceCompletionActivation,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_SOURCE_COMPLETION_ACTIVATION_INTERACTIVE',
		'GTK_SOURCE_COMPLETION_ACTIVATION_NONE',
		'GTK_SOURCE_COMPLETION_ACTIVATION_USER_REQUESTED'
	],
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #'enum declaration' }
GtkSourceCompletionActivation class >> enumDecl [
	"self initializeEnumeration"
	
	^ #(
	GTK_SOURCE_COMPLETION_ACTIVATION_NONE 				0
	GTK_SOURCE_COMPLETION_ACTIVATION_INTERACTIVE 		1
	GTK_SOURCE_COMPLETION_ACTIVATION_USER_REQUESTED 	2
	)
]
