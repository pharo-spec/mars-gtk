"
enum GtkMessageType
The type of message being displayed in the dialog.

https://developer.gnome.org/gtk3/stable/GtkMessageDialog.html#GtkMessageType
"
Class {
	#name : #GtkMessageType,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_MESSAGE_ERROR',
		'GTK_MESSAGE_INFO',
		'GTK_MESSAGE_OTHER',
		'GTK_MESSAGE_QUESTION',
		'GTK_MESSAGE_WARNING'
	],
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #'accessing enum' }
GtkMessageType class >> GTK_MESSAGE_ERROR [
	"This method was automatically generated"
	^ GTK_MESSAGE_ERROR
]

{ #category : #'accessing enum' }
GtkMessageType class >> GTK_MESSAGE_INFO [
	"This method was automatically generated"
	^ GTK_MESSAGE_INFO
]

{ #category : #'accessing enum' }
GtkMessageType class >> GTK_MESSAGE_OTHER [
	"This method was automatically generated"
	^ GTK_MESSAGE_OTHER
]

{ #category : #'accessing enum' }
GtkMessageType class >> GTK_MESSAGE_QUESTION [
	"This method was automatically generated"
	^ GTK_MESSAGE_QUESTION
]

{ #category : #'accessing enum' }
GtkMessageType class >> GTK_MESSAGE_WARNING [
	"This method was automatically generated"
	^ GTK_MESSAGE_WARNING
]

{ #category : #'field definition' }
GtkMessageType class >> enumDecl [

	^ #(
	  GTK_MESSAGE_INFO       0
	  GTK_MESSAGE_WARNING    1
	  GTK_MESSAGE_QUESTION   2
	  GTK_MESSAGE_ERROR      3
	  GTK_MESSAGE_OTHER      4
	)
]
