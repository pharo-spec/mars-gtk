"
The connection flags are used to specify the behaviour of a signal's connection.

https://developer.gnome.org/gobject/unstable/gobject-Signals.html#GConnectFlags
"
Class {
	#name : #GConnectFlags,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'G_CONNECT_AFTER',
		'G_CONNECT_NONE',
		'G_CONNECT_SWAPPED'
	],
	#category : 'Mars-Gtk-Widget'
}

{ #category : #'as yet unclassified' }
GConnectFlags class >> enumDecl [
	^ { 
	#G_CONNECT_NONE. 		0.
 	#G_CONNECT_AFTER. 		1 << 0.
  	#G_CONNECT_SWAPPED. 	1 << 1 }
]
