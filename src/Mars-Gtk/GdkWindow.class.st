"
Windows — Onscreen display areas in the target window system

https://developer.gnome.org/gdk3/stable/gdk3-Windows.html#GdkWindow

IMPORTANT! This is not an actual window, but an ""display area on the screen"" 
"
Class {
	#name : #GdkWindow,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'library path' }
GdkWindow class >> ffiLibraryName [ 

	^ GdkLibrary
]

{ #category : #accessing }
GdkWindow class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_window_get_type())
]

{ #category : #accessing }
GdkWindow >> beep [

	"Emits a short beep associated to window in the appropriate display, if supported. Otherwise, emits a short beep on the display just as gdk_display_beep()."
	self ffiCall: #(void gdk_window_beep (GdkWindow * self))
]

{ #category : #accessing }
GdkWindow >> cursor: cursor [

	"Use #cursor: to store the cursor in the object"
	self ffiCall: #(void gdk_window_set_cursor (self, GdkCursor *cursor))
]

{ #category : #'library path' }
GdkWindow >> ffiLibraryName [ 

	^ GdkLibrary
]

{ #category : #accessing }
GdkWindow >> positionOfDevice: device [
	| xBuffer yBuffer |
	
	xBuffer := FFIFloat64 newBuffer.
	yBuffer := FFIFloat64 newBuffer.
	
	self positionOfDevice: device x: xBuffer y: yBuffer.
	
	^ (xBuffer doubleAt: 1) @ (yBuffer doubleAt: 1)
]

{ #category : #private }
GdkWindow >> positionOfDevice: device x: x y: y [

	^ self ffiCall: #(GdkWindow *gdk_window_get_device_position_double (
		self, 
		GdkDevice *device,
		gdouble *x,
		gdouble *y,
		NULL))
]

{ #category : #accessing }
GdkWindow >> positionOfPointer [

	^ self positionOfDevice: GdkDisplay default defaultSeat pointer
]
