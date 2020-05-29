"
Specifies the state of a toplevel window.

https://developer.gnome.org/gdk3/stable/gdk3-Event-Structures.html#GdkWindowState
"
Class {
	#name : #GdkWindowState,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GDK_WINDOW_STATE_ABOVE',
		'GDK_WINDOW_STATE_BELOW',
		'GDK_WINDOW_STATE_BOTTOM_RESIZABLE',
		'GDK_WINDOW_STATE_BOTTOM_TILED',
		'GDK_WINDOW_STATE_FOCUSED',
		'GDK_WINDOW_STATE_FULLSCREEN',
		'GDK_WINDOW_STATE_ICONIFIED',
		'GDK_WINDOW_STATE_LEFT_RESIZABLE',
		'GDK_WINDOW_STATE_LEFT_TILED',
		'GDK_WINDOW_STATE_MAXIMIZED',
		'GDK_WINDOW_STATE_RIGHT_RESIZABLE',
		'GDK_WINDOW_STATE_RIGHT_TILED',
		'GDK_WINDOW_STATE_STICKY',
		'GDK_WINDOW_STATE_TILED',
		'GDK_WINDOW_STATE_TOP_RESIZABLE',
		'GDK_WINDOW_STATE_TOP_TILED',
		'GDK_WINDOW_STATE_WITHDRAWN'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_ABOVE [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_ABOVE
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_BELOW [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_BELOW
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_BOTTOM_RESIZABLE [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_BOTTOM_RESIZABLE
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_BOTTOM_TILED [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_BOTTOM_TILED
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_FOCUSED [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_FOCUSED
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_FULLSCREEN [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_FULLSCREEN
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_ICONIFIED [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_ICONIFIED
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_LEFT_RESIZABLE [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_LEFT_RESIZABLE
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_LEFT_TILED [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_LEFT_TILED
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_MAXIMIZED [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_MAXIMIZED
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_RIGHT_RESIZABLE [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_RIGHT_RESIZABLE
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_RIGHT_TILED [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_RIGHT_TILED
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_STICKY [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_STICKY
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_TILED [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_TILED
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_TOP_RESIZABLE [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_TOP_RESIZABLE
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_TOP_TILED [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_TOP_TILED
]

{ #category : #'accessing enum' }
GdkWindowState class >> GDK_WINDOW_STATE_WITHDRAWN [
	"This method was automatically generated"
	^ GDK_WINDOW_STATE_WITHDRAWN
]

{ #category : #'field definition' }
GdkWindowState class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors"

	^ { 
	#GDK_WINDOW_STATE_WITHDRAWN. 			1 << 0.
	#GDK_WINDOW_STATE_ICONIFIED. 			1 << 1.
	#GDK_WINDOW_STATE_MAXIMIZED. 			1 << 2.
	#GDK_WINDOW_STATE_STICKY. 				1 << 3.
	#GDK_WINDOW_STATE_FULLSCREEN. 			1 << 4.
	#GDK_WINDOW_STATE_ABOVE. 				1 << 5.
	#GDK_WINDOW_STATE_BELOW. 				1 << 6.
	#GDK_WINDOW_STATE_FOCUSED. 				1 << 7.
	#GDK_WINDOW_STATE_TILED. 				1 << 8.
	#GDK_WINDOW_STATE_TOP_TILED. 			1 << 9.
	#GDK_WINDOW_STATE_TOP_RESIZABLE. 		1 << 10.
	#GDK_WINDOW_STATE_RIGHT_TILED. 		1 << 11.
	#GDK_WINDOW_STATE_RIGHT_RESIZABLE. 	1 << 12.
	#GDK_WINDOW_STATE_BOTTOM_TILED. 		1 << 13.
	#GDK_WINDOW_STATE_BOTTOM_RESIZABLE. 	1 << 14.
	#GDK_WINDOW_STATE_LEFT_TILED. 			1 << 15.
	#GDK_WINDOW_STATE_LEFT_RESIZABLE. 	1 << 16	
	 }
]
