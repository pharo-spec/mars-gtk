"
The GdkPixbuf Structure — Information that describes an image.

https://developer.gnome.org/gdk-pixbuf/stable/gdk-pixbuf-The-GdkPixbuf-Structure.html
"
Class {
	#name : #GdkPixbuf,
	#superclass : #GBaseObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #private }
GdkPixbuf class >> getFromSurface: surface x: src_x y: src_y width: width height: height [
	"https://developer.gnome.org/gdk3/stable/gdk3-Pixbufs.html#gdk-pixbuf-get-from-surface"
	
	^ self ffiCall: #(GdkPixbuf *gdk_pixbuf_get_from_surface (
		AthensCairoSurface surface,
		gint src_x,
		gint src_y,
		gint width,
		gint height)) module: GdkLibrary
]

{ #category : #'instance creation' }
GdkPixbuf class >> newForm: aForm [

	^ self newMorph: aForm asMorph
]

{ #category : #'instance creation' }
GdkPixbuf class >> newMorph: anImageMorph [
	| surface w h |

	surface := self surfaceFor: anImageMorph.
	w := anImageMorph width asInteger.
	h := anImageMorph height asInteger.

	^ (self getFromSurface: surface x: 0 y: 0 width: w height: h) initialize
]

{ #category : #private }
GdkPixbuf class >> surfaceFor: anImageMorph [
	| surface |

	surface := AthensCairoSurface extent: anImageMorph extent.
	surface drawDuring: [ :canvas |
		anImageMorph drawOnAthensCanvas: canvas ].
	
	^ surface
]

{ #category : #accessing }
GdkPixbuf >> depth [
	
	^ self numberOfChannels * 8
]

{ #category : #comparing }
GdkPixbuf >> height [ 

	^ self ffiCall: #(int gdk_pixbuf_get_height(self)) module: GdkPixbufLibrary
]

{ #category : #comparing }
GdkPixbuf >> isSimilarTo: aGdkPixbuf [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
GdkPixbuf >> numberOfChannels [
	
	^ self ffiCall: #(int gdk_pixbuf_get_n_channels(self)) module: GdkPixbufLibrary
]

{ #category : #comparing }
GdkPixbuf >> width [ 

	^ self ffiCall: #(int gdk_pixbuf_get_width(self)) module: GdkPixbufLibrary
]
