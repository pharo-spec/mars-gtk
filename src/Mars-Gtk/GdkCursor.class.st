Class {
	#name : #GdkCursor,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #private }
GdkCursor class >> cursorNewFromName: aName display: display [

	^ self ffiCall: #(GdkCursor *gdk_cursor_new_from_name (
		GdkDisplay *display,
		const gchar *aName))
]

{ #category : #private }
GdkCursor class >> cursorNewFromSurface: surface display: display x: x y: y [

	^ self ffiCall: #(GdkCursor * gdk_cursor_new_from_surface (
		GdkDisplay *display,
		"cairo_surface_t *"void *surface,
		gdouble x,
 		gdouble y))
]

{ #category : #'library path' }
GdkCursor class >> ffiLibrary [

	^ GdkLibrary
]

{ #category : #accessing }
GdkCursor class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gdk_cursor_init(void *object))
]

{ #category : #accessing }
GdkCursor class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_cursor_get_type())
]

{ #category : #'instance creation' }
GdkCursor class >> newFromName: aName [

	^ (self 
		cursorNewFromName: aName
		display: GdkDisplay default)
		initialize
]

{ #category : #'instance creation' }
GdkCursor class >> newFromSurface: aSurface [

	^ (self 
		cursorNewFromSurface: aSurface getHandle
		display: GdkDisplay default 
		x: 0.0
		y: 0.0)
		initialize
]

{ #category : #resources }
GdkCursor >> ffiLibrary [

	^ GdkLibrary
]
