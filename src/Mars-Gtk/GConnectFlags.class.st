"
The connection flags are used to specify the behaviour of a signal's connection.

https://developer.gnome.org/gobject/unstable/gobject-Signals.html#GConnectFlags
"
Class {
	#name : #GConnectFlags,
	#superclass : #GtkEnumeration,
	#classVars : [
		'G_CONNECT_AFTER',
		'G_CONNECT_NONE',
		'G_CONNECT_SWAPPED'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GConnectFlags class >> G_CONNECT_AFTER [
	"This method was automatically generated"
	^ G_CONNECT_AFTER
]

{ #category : #'accessing enum' }
GConnectFlags class >> G_CONNECT_NONE [
	"This method was automatically generated"
	^ G_CONNECT_NONE
]

{ #category : #'accessing enum' }
GConnectFlags class >> G_CONNECT_SWAPPED [
	"This method was automatically generated"
	^ G_CONNECT_SWAPPED
]

{ #category : #'as yet unclassified' }
GConnectFlags class >> enumDecl [
	^ { 
	#G_CONNECT_NONE. 		0.
 	#G_CONNECT_AFTER. 		1 << 0.
  	#G_CONNECT_SWAPPED. 	1 << 1 }
]
