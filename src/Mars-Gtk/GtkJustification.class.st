"
Used for justifying the text inside a GtkLabel widget. (See also GtkAlignment).
"
Class {
	#name : #GtkJustification,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'GTK_JUSTIFY_CENTER',
		'GTK_JUSTIFY_FILL',
		'GTK_JUSTIFY_LEFT',
		'GTK_JUSTIFY_RIGHT'
	],
	#category : 'Mars-Gtk-Widget'
}

{ #category : #'enum declaration' }
GtkJustification class >> enumDecl [
	^ #(
	GTK_JUSTIFY_LEFT 		0
	GTK_JUSTIFY_RIGHT 		1
	GTK_JUSTIFY_CENTER 	2
	GTK_JUSTIFY_FILL 		3
	)
]
