"
Describes primary purpose of the input widget. This information is useful for on-screen keyboards and similar input methods to decide which keys should be presented to the user.
Note that the purpose is not meant to impose a totally strict rule about allowed characters, and does not replace input validation. It is fine for an on-screen keyboard to let the user override the character set restriction that is expressed by the purpose. The application is expected to validate the entry contents, even if it specified a purpose.
The difference between GTK_INPUT_PURPOSE_DIGITS and GTK_INPUT_PURPOSE_NUMBER is that the former accepts only digits while the latter also some punctuation (like commas or points, plus, minus) and “e” or “E” as in 3.14E+000.
This enumeration may be extended in the future; input methods should interpret unknown values as “free form”.

https://developer.gnome.org/gtk3/stable/GtkEntry.html#GtkInputPurpose
"
Class {
	#name : #GtkInputPurpose,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_INPUT_PURPOSE_ALPHA',
		'GTK_INPUT_PURPOSE_DIGITS',
		'GTK_INPUT_PURPOSE_EMAIL',
		'GTK_INPUT_PURPOSE_FREE_FORM',
		'GTK_INPUT_PURPOSE_NAME',
		'GTK_INPUT_PURPOSE_NUMBER',
		'GTK_INPUT_PURPOSE_PASSWORD',
		'GTK_INPUT_PURPOSE_PHONE',
		'GTK_INPUT_PURPOSE_PIN',
		'GTK_INPUT_PURPOSE_URL'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkInputPurpose class >> GTK_INPUT_PURPOSE_ALPHA [
	"This method was automatically generated"
	^ GTK_INPUT_PURPOSE_ALPHA
]

{ #category : #'accessing enum' }
GtkInputPurpose class >> GTK_INPUT_PURPOSE_DIGITS [
	"This method was automatically generated"
	^ GTK_INPUT_PURPOSE_DIGITS
]

{ #category : #'accessing enum' }
GtkInputPurpose class >> GTK_INPUT_PURPOSE_EMAIL [
	"This method was automatically generated"
	^ GTK_INPUT_PURPOSE_EMAIL
]

{ #category : #'accessing enum' }
GtkInputPurpose class >> GTK_INPUT_PURPOSE_FREE_FORM [
	"This method was automatically generated"
	^ GTK_INPUT_PURPOSE_FREE_FORM
]

{ #category : #'accessing enum' }
GtkInputPurpose class >> GTK_INPUT_PURPOSE_NAME [
	"This method was automatically generated"
	^ GTK_INPUT_PURPOSE_NAME
]

{ #category : #'accessing enum' }
GtkInputPurpose class >> GTK_INPUT_PURPOSE_NUMBER [
	"This method was automatically generated"
	^ GTK_INPUT_PURPOSE_NUMBER
]

{ #category : #'accessing enum' }
GtkInputPurpose class >> GTK_INPUT_PURPOSE_PASSWORD [
	"This method was automatically generated"
	^ GTK_INPUT_PURPOSE_PASSWORD
]

{ #category : #'accessing enum' }
GtkInputPurpose class >> GTK_INPUT_PURPOSE_PHONE [
	"This method was automatically generated"
	^ GTK_INPUT_PURPOSE_PHONE
]

{ #category : #'accessing enum' }
GtkInputPurpose class >> GTK_INPUT_PURPOSE_PIN [
	"This method was automatically generated"
	^ GTK_INPUT_PURPOSE_PIN
]

{ #category : #'accessing enum' }
GtkInputPurpose class >> GTK_INPUT_PURPOSE_URL [
	"This method was automatically generated"
	^ GTK_INPUT_PURPOSE_URL
]

{ #category : #'enum declaration' }
GtkInputPurpose class >> enumDecl [

	^ #(
  GTK_INPUT_PURPOSE_FREE_FORM 		0
  GTK_INPUT_PURPOSE_ALPHA 			1
  GTK_INPUT_PURPOSE_DIGITS 			2
  GTK_INPUT_PURPOSE_NUMBER 			3
  GTK_INPUT_PURPOSE_PHONE 			4
  GTK_INPUT_PURPOSE_URL 				5
  GTK_INPUT_PURPOSE_EMAIL 			6
  GTK_INPUT_PURPOSE_NAME 			7
  GTK_INPUT_PURPOSE_PASSWORD 		8
  GTK_INPUT_PURPOSE_PIN				9
	)
]
