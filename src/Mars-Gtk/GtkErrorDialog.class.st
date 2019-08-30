"
I'm an error dialog.
"
Class {
	#name : #GtkErrorDialog,
	#superclass : #GtkInformDialog,
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #accessing }
GtkErrorDialog class >> defaultTitle [

	^ 'Error'
]

{ #category : #accessing }
GtkErrorDialog class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_error_dialog_get_type())
]

{ #category : #private }
GtkErrorDialog class >> windowNew: type [ 

	^ self ffiCall: #( GtkErrorDialog *gtk_window_new ( GtkWindowType type ) )
]
