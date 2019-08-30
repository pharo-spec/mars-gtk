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

{ #category : #private }
GtkErrorDialog class >> windowNew: type [ 

	^ self ffiCall: #( GtkErrorDialog *gtk_window_new ( GtkWindowType type ) )
]
