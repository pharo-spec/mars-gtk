"
Used for justifying the text inside a GtkLabel widget. (See also GtkAlignment).
"
Class {
	#name : #GtkJustification,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_JUSTIFY_CENTER',
		'GTK_JUSTIFY_FILL',
		'GTK_JUSTIFY_LEFT',
		'GTK_JUSTIFY_RIGHT'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkJustification class >> GTK_JUSTIFY_CENTER [
	"This method was automatically generated"
	^ GTK_JUSTIFY_CENTER
]

{ #category : #'accessing enum' }
GtkJustification class >> GTK_JUSTIFY_FILL [
	"This method was automatically generated"
	^ GTK_JUSTIFY_FILL
]

{ #category : #'accessing enum' }
GtkJustification class >> GTK_JUSTIFY_LEFT [
	"This method was automatically generated"
	^ GTK_JUSTIFY_LEFT
]

{ #category : #'accessing enum' }
GtkJustification class >> GTK_JUSTIFY_RIGHT [
	"This method was automatically generated"
	^ GTK_JUSTIFY_RIGHT
]

{ #category : #'enum declaration' }
GtkJustification class >> enumDecl [
	^ #(
	GTK_JUSTIFY_LEFT 		0
	GTK_JUSTIFY_RIGHT 		1
	GTK_JUSTIFY_CENTER 	2
	GTK_JUSTIFY_FILL 		3
	)
]
