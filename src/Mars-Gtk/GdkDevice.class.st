"
GdkDevice — Object representing an input device

https://developer.gnome.org/gdk3/stable/GdkDevice.html
"
Class {
	#name : #GdkDevice,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'library path' }
GdkDevice class >> ffiLibraryName [ 

	^ GdkLibrary
]

{ #category : #accessing }
GdkDevice class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gdk_device_init(void *object))
]

{ #category : #accessing }
GdkDevice class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_device_get_type())
]

{ #category : #'library path' }
GdkDevice >> ffiLibraryName [ 

	^ GdkLibrary
]
