Class {
	#name : #GtkResponseType,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_RESPONSE_ACCEPT',
		'GTK_RESPONSE_APPLY',
		'GTK_RESPONSE_CANCEL',
		'GTK_RESPONSE_CLOSE',
		'GTK_RESPONSE_DELETE_EVENT',
		'GTK_RESPONSE_HELP',
		'GTK_RESPONSE_NO',
		'GTK_RESPONSE_NONE',
		'GTK_RESPONSE_OK',
		'GTK_RESPONSE_REJECT',
		'GTK_RESPONSE_YES'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #'accessing enum' }
GtkResponseType class >> GTK_RESPONSE_ACCEPT [
	"This method was automatically generated"
	^ GTK_RESPONSE_ACCEPT
]

{ #category : #'accessing enum' }
GtkResponseType class >> GTK_RESPONSE_APPLY [
	"This method was automatically generated"
	^ GTK_RESPONSE_APPLY
]

{ #category : #'accessing enum' }
GtkResponseType class >> GTK_RESPONSE_CANCEL [
	"This method was automatically generated"
	^ GTK_RESPONSE_CANCEL
]

{ #category : #'accessing enum' }
GtkResponseType class >> GTK_RESPONSE_CLOSE [
	"This method was automatically generated"
	^ GTK_RESPONSE_CLOSE
]

{ #category : #'accessing enum' }
GtkResponseType class >> GTK_RESPONSE_DELETE_EVENT [
	"This method was automatically generated"
	^ GTK_RESPONSE_DELETE_EVENT
]

{ #category : #'accessing enum' }
GtkResponseType class >> GTK_RESPONSE_HELP [
	"This method was automatically generated"
	^ GTK_RESPONSE_HELP
]

{ #category : #'accessing enum' }
GtkResponseType class >> GTK_RESPONSE_NO [
	"This method was automatically generated"
	^ GTK_RESPONSE_NO
]

{ #category : #'accessing enum' }
GtkResponseType class >> GTK_RESPONSE_NONE [
	"This method was automatically generated"
	^ GTK_RESPONSE_NONE
]

{ #category : #'accessing enum' }
GtkResponseType class >> GTK_RESPONSE_OK [
	"This method was automatically generated"
	^ GTK_RESPONSE_OK
]

{ #category : #'accessing enum' }
GtkResponseType class >> GTK_RESPONSE_REJECT [
	"This method was automatically generated"
	^ GTK_RESPONSE_REJECT
]

{ #category : #'accessing enum' }
GtkResponseType class >> GTK_RESPONSE_YES [
	"This method was automatically generated"
	^ GTK_RESPONSE_YES
]

{ #category : #'enum declaration' }
GtkResponseType class >> enumDecl [
	"self initializeEnumeration"

	^ #(
  GTK_RESPONSE_NONE          -1
  GTK_RESPONSE_REJECT        -2
  GTK_RESPONSE_ACCEPT        -3
  GTK_RESPONSE_DELETE_EVENT  -4
  GTK_RESPONSE_OK            -5
  GTK_RESPONSE_CANCEL        -6
  GTK_RESPONSE_CLOSE         -7
  GTK_RESPONSE_YES           -8
  GTK_RESPONSE_NO            -9
  GTK_RESPONSE_APPLY         -10
  GTK_RESPONSE_HELP          -11	
	)
]
