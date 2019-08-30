"
GdkSeat — Object representing an user seat

https://developer.gnome.org/gdk3/unstable/GdkSeat.html
"
Class {
	#name : #GdkSeat,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'instance creation' }
GdkSeat class >> defaultForDisplay: aDisplay [ 

	^ (self getDefaultSeat: aDisplay) initialize
]

{ #category : #'library path' }
GdkSeat class >> ffiLibraryName [ 

	^ GdkLibrary
]

{ #category : #accessing }
GdkSeat class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gdk_seat_init(void *object))
]

{ #category : #accessing }
GdkSeat class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_seat_get_type())
]

{ #category : #private }
GdkSeat class >> getDefaultSeat: display [

	^ self ffiCall: #(GdkSeat *gdk_display_get_default_seat (GdkDisplay *display))
]

{ #category : #'library path' }
GdkSeat >> ffiLibraryName [ 

	^ GdkLibrary
]

{ #category : #accessing }
GdkSeat >> gtkGetPointer [

	^ self ffiCall: #(GdkDevice *gdk_seat_get_pointer (self))
]

{ #category : #accessing }
GdkSeat >> pointer [

	^ self gtkGetPointer initialize
]
