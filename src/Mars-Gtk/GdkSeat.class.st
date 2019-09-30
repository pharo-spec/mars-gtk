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

	"do not send #initialize here because we do not need it (and keeping a reference 
	 is useless since this is kept in Gtk3."
	^ (self getDefaultSeat: aDisplay) "initialize"
]

{ #category : #'library path' }
GdkSeat class >> ffiLibraryName [ 

	^ GdkLibrary
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

	"do not send #initialize here because we do not need it (and keeping a reference 
	 is useless since this is kept in Gtk3."
	^ self gtkGetPointer "initialize"
]
