"
GdkMonitor
GdkMonitor — Object representing an output

https://developer.gnome.org/gdk3/stable/GdkMonitor.html
"
Class {
	#name : #GdkMonitor,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'library path' }
GdkMonitor class >> ffiLibraryName [

	^ GdkLibrary
]

{ #category : #accessing }
GdkMonitor class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_monitor_get_type())
]

{ #category : #private }
GdkMonitor class >> getOn: display number: monitor_num [

	^ self ffiCall: #(GdkMonitor *
gdk_display_get_monitor (GdkDisplay *display,
                         int monitor_num))
]

{ #category : #private }
GdkMonitor class >> getPrimaryOn: display [

	^ self ffiCall: #(GdkMonitor * gdk_display_get_primary_monitor (GdkDisplay *display))
]

{ #category : #'instance creation' }
GdkMonitor class >> on: aDisplay number: aNumber [ 

	^ (self getOn: aDisplay number: aNumber) initialize
]

{ #category : #'instance creation' }
GdkMonitor class >> primaryOn: aDisplay [ 

	^ (self getPrimaryOn: aDisplay) initialize
]

{ #category : #'library path' }
GdkMonitor >> ffiLibraryName [ 

	^ self class ffiLibraryName
]

{ #category : #accessing }
GdkMonitor >> forceRectangleToFitLimits: aRectangle [
	| rect geometry |
	
	rect := aRectangle.
	geometry := self geometry.
	rect top >= geometry bottom ifTrue: [ rect := rect withTop: 0 ].
	rect left >= geometry right ifTrue: [ rect := rect withLeft: 0 ].
	rect bottom >= geometry bottom ifTrue: [ rect := rect withBottom: geometry bottom ].
	rect right >= geometry right ifTrue: [ rect := rect withRight: geometry right ].
	
	^ rect
]

{ #category : #accessing }
GdkMonitor >> geometry [
	| rect |
	
	rect := GdkRectangle new. 
	rect pinInMemory.
	self getGeometry: rect.
	^ rect asRectangle
]

{ #category : #private }
GdkMonitor >> getGeometry: geometry [
	
	self ffiCall: #(void gdk_monitor_get_geometry (self, GdkRectangle *geometry))
]
