"
GdkDisplay
GdkDisplay — Controls a set of GdkScreens and their associated input devices

https://developer.gnome.org/gdk3/stable/GdkDisplay.html
"
Class {
	#name : #GdkDisplay,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'instance creation' }
GdkDisplay class >> default [ 

	^ self getDefault initialize
]

{ #category : #'library path' }
GdkDisplay class >> ffiLibraryName [ 

	^ GdkLibrary
]

{ #category : #'as yet unclassified' }
GdkDisplay class >> forceRectangleToFitLimits: aRect [

	^ self default primaryMonitor forceRectangleToFitLimits: aRect
]

{ #category : #private }
GdkDisplay class >> getDefault [

	^ self ffiCall: #(GdkDisplay *gdk_display_get_default (void))
]

{ #category : #accessing }
GdkDisplay >> defaultSeat [ 

	^ GdkSeat defaultForDisplay: self
]

{ #category : #'library path' }
GdkDisplay >> ffiLibraryName [ 

	^ self class ffiLibraryName
]

{ #category : #accessing }
GdkDisplay >> monitorAt: aNumber [

	^ GdkMonitor on: self number: aNumber
]

{ #category : #accessing }
GdkDisplay >> primaryMonitor [

	^ GdkMonitor primaryOn: self
]
