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

{ #category : #'library path' }
GdkWindow >> ffiLibraryName [ 

	^ GdkLibrary
]

{ #category : #accessing }
GdkWindow >> positionOfDevice: device [
	| xBuffer yBuffer |
	
	xBuffer := FFIInt32 newBuffer.
	yBuffer := FFIInt32 newBuffer.
	
	self positionOfDevice: device x: xBuffer y: yBuffer.
	
	^ (xBuffer signedLongAt: 1) @ (yBuffer signedLongAt: 1)
]

{ #category : #private }
GdkWindow >> positionOfDevice: device x: x y: y [

	^ self ffiCall: #(GdkWindow *gdk_window_get_device_position (
		self, 
		GdkDevice *device,
		gint *x,
		gint *y,
		NULL))
]
