"
I'm a cairo surface to be used on form rendering. 
It will create a cairo surface that does not needs to be mapped to RGBA (as my parent does).
"
Class {
	#name : #GtkCairoSurface,
	#superclass : #AthensCairoSurface,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #'instance creation' }
GtkCairoSurface class >> extent: anExtent [

	^ self platformClass
		extent: anExtent 
		format: CAIRO_FORMAT_RGB24
]

{ #category : #'instance creation' }
GtkCairoSurface class >> extent: anExtent format: aFormat [

	^ (self primImage: aFormat width: anExtent x height: anExtent y) initialize

]

{ #category : #'finalize resources' }
GtkCairoSurface class >> finalizeResourceData: data [
	| handle id contextHandle |

	handle := data first.
	id := data second.
	contextHandle := data third.
	
	self destroyContextHandle: contextHandle value. 
	self destroySurfaceHandle: handle value.
	
	(self findSurface: id) = handle value 
		ifFalse: [  ^ self ].	
	self unregisterSurfaceWithId: id
]

{ #category : #'instance creation' }
GtkCairoSurface class >> fromForm: aForm [
	| form surface |
	
	form := aForm unhibernate; asFormOfDepth: 32.
	surface := self extent: aForm extent.
	
	LibC 
		memCopy: form bits
		to: surface getDataPtr getHandle 
		size: (form width * form height * 4).
	
	surface markDirty.

	^ surface.

]

{ #category : #'instance creation' }
GtkCairoSurface class >> fromImageMorph: anImageMorph [
	| surface |

	surface := self extent: anImageMorph extent.
	surface drawDuring: [ :canvas |
		anImageMorph drawOnAthensCanvas: canvas ].
	
	^ surface
]

{ #category : #private }
GtkCairoSurface class >> platformClass [
		
	"OSPlatform current isMacOS ifTrue: [ ^ GtkQuartzCairoSurface ]."
	^ self
]

{ #category : #private }
GtkCairoSurface class >> primImage: aFormat width: aWidth height: aHeight [
	"rewrite to answer correct receiver"

	^ self ffiCall: #(GtkCairoSurface cairo_image_surface_create (
		int aFormat,
		int aWidth,
		int aHeight))

]

{ #category : #'private primitives' }
GtkCairoSurface >> cairoCreate: target [

	^ self 
		ffiCall: #("cairo_t"void *cairo_create ("cairo_surface_t"void *target))
		module: CairoLibrary
]

{ #category : #'private primitives' }
GtkCairoSurface >> cairoDestroy: cr [

	self 
		ffiCall: #(void cairo_destroy ("cairo_t *"void *cr))
		module: CairoLibrary
]

{ #category : #'private primitives' }
GtkCairoSurface >> cairoRectangle: aCr x: xValue y: yValue	width: aWidth height: aHeight [

	self 
		ffiCall: #(void cairo_rectangle (void *aCr,
                 double xValue,
                 double yValue,
                 double aWidth,
                 double aHeight))
		module: CairoLibrary
]

{ #category : #'private primitives' }
GtkCairoSurface >> cairoScale: cr x: sx y: sy [

	self 
		ffiCall: #(void cairo_scale (void *cr, double sx, double sy)) 
		module: CairoLibrary
]

{ #category : #private }
GtkCairoSurface >> clipRectangleFrom: aCr [
	| rect |
	
	rect := GdkRectangle new.
	self getClipRectangle: rect from: aCr.
	^ rect asRectangle
]

{ #category : #copying }
GtkCairoSurface >> copyForm: aForm clippedBy: aRect at: aPoint [
	"Will copy the contents of aForm into this surface at aPoint"
	| cr newSurface |

	cr := self cairoCreate: self getHandle.
	newSurface := GtkCairoSurface fromForm: aForm.
	[ newSurface paintInto: cr at: aPoint ]
	ensure: [ 
		self cairoDestroy: cr ]
]

{ #category : #'private primitives' }
GtkCairoSurface >> fill: cr [

	self 
		ffiCall: #(void cairo_fill (void *cr))
		module: CairoLibrary
]

{ #category : #operations }
GtkCairoSurface >> fillInto: cr [
	"fills 'cr' with this surface. 
	 it will take the clipping rectangle as the surface area to draw"
	| rect |

	rect := self clipRectangleFrom: cr.

"	cairo_set_source_surface (cr, src_surface, x_dest - x_src, y_dest - y_src);
	cairo_rectangle (cr, x_dest, y_dest, width, height);
	cairo_fill (cr);
"
	self 
		setSourceSurfaceTo: cr
		surface: self getHandle
		x: 0.0 
		y: 0.0.

	self 
		cairoRectangle: cr 
		x: rect origin x asFloat 
		y: rect origin y asFloat 
		width: rect width asFloat 
		height: rect height asFloat.

	self fill: cr
]

{ #category : #'private primitives' }
GtkCairoSurface >> getClipRectangle: rect from: cr [
	
	^ self 
		ffiCall: #(gboolean gdk_cairo_get_clip_rectangle (
			"cairo_t *"void *cr,
  			GdkRectangle *rect))
		module: GdkLibrary
]

{ #category : #'private primitives' }
GtkCairoSurface >> paint: cr [

	self 
		ffiCall: #(void cairo_paint (void *cr))
		module: CairoLibrary
]

{ #category : #operations }
GtkCairoSurface >> paintInto: cr at: aPoint [
	"Paints this surface into 'cr' at specified positition"

	self 
		setSourceSurfaceTo: cr
		surface: self getHandle
		x: aPoint x asFloat
		y: aPoint y asFloat.
	self paint: cr
]

{ #category : #copying }
GtkCairoSurface >> scale: cr [ 

	self cairoScale: cr x: 0.5 y: 0.5
]

{ #category : #'private primitives' }
GtkCairoSurface >> setSourceSurfaceTo: cr surface: surface x: x y: y [

	self 
		ffiCall: #(void cairo_set_source_surface (void *cr, void *surface, double x, double y))
		module: CairoLibrary
]
