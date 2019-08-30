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

{ #category : #accessing }
GdkScreen class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gdk_screen_init(void *object))
]

{ #category : #accessing }
GdkScreen class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_screen_get_type())
]

{ #category : #private }
GdkScreen class >> getDefault [

	^ self ffiCall: #(GdkScreen *gdk_screen_get_default ())
]
