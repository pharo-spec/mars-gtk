"
GdkScreen — Object representing a physical screen

https://developer.gnome.org/gdk3/stable/GdkScreen.html
"
Class {
	#name : #GdkScreen,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'instance creation' }
GdkScreen class >> default [

	^ self getDefault initialize
]

{ #category : #private }
GdkScreen class >> getDefault [

	^ self ffiCall: #(GdkScreen *gdk_screen_get_default ())
]
