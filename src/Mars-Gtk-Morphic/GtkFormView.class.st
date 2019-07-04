"
I'm a widget to display a world contained in a Form.
Being a Form a bitmap, this component could be used to display any kind of Form, containded in a World (provided through the event handler).
"
Class {
	#name : #GtkFormView,
	#superclass : #GtkMorphicDrawingArea,
	#instVars : [
		'form',
		'surface'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #private }
GtkFormView class >> drawingAreaNew [

	^ self ffiCall: #(GtkFormView *gtk_drawing_area_new ())
]

{ #category : #private }
GtkFormView >> cairoCreate: aSurface [.

	self ffiCall: #("cairo_t*"void *cairo_create ("cairo_surface_t*" void *aSurface))	
]

{ #category : #private }
GtkFormView >> cairoDestroy: aCr [.

	self ffiCall: #(void cairo_destroy ("cairo_t *" void* aCr))	
]

{ #category : #private }
GtkFormView >> canDraw [

	^ true
]

{ #category : #'private updating' }
GtkFormView >> clipRectangleFrom: aCr [
	| rect |
	
	rect := GdkRectangle new.
	self getClipRectangle: rect from: aCr.
	^ rect asRectangle
]

{ #category : #private }
GtkFormView >> currentExtent [

	^ self form extent
]

{ #category : #drawing }
GtkFormView >> draw: aCr [

	| rect |
	surface ifNil: [ ^ false ].

	rect := self clipRectangleFrom: aCr.

"	cairo_set_source_surface (cr, src_surface, x_dest - x_src, y_dest - y_src);
	cairo_rectangle (cr, x_dest, y_dest, width, height);
	cairo_fill (cr);
"
	self 
		setSourceSurfaceTo: aCr
		surface: surface getHandle
		x: 0.0 
		y: 0.0.

	self 
		cairoRectangle: aCr 
		x: rect origin x asFloat 
		y: rect origin y asFloat 
		width: rect width asFloat 
		height: rect height asFloat.

	self fill: aCr.

	^ false
]

{ #category : #accessing }
GtkFormView >> form [

	^ form
]

{ #category : #accessing }
GtkFormView >> form: aForm [

	form := aForm.
	self sizeRequest: aForm extent.
	self invalidate	
]

{ #category : #'private updating' }
GtkFormView >> getClipRectangle: rect from: cr [
	
	^ self 
		ffiCall: #(gboolean gdk_cairo_get_clip_rectangle (
			"cairo_t *"void *cr,
  			GdkRectangle *rect))
		module: GLibLibrary
]

{ #category : #'private updating' }
GtkFormView >> getContext: surface [
	
	^ self ffiCall: #(void *cairo_quartz_surface_get_cg_context (void *surface)) module: CairoLibrary
]

{ #category : #'private updating' }
GtkFormView >> getTargetFrom: cr [
	
	^ self ffiCall: #(void *cairo_get_target (void *cr)) module: CairoLibrary
]

{ #category : #'private events' }
GtkFormView >> handleEvent: anEvent [

	anEvent type = GdkEventType GDK_ENTER_NOTIFY 
		ifTrue: [ self grabFocus ].
	^ super handleEvent: anEvent
]

{ #category : #accessing }
GtkFormView >> invalidate [

	self updateSurface.
	self queueDraw
]

{ #category : #accessing }
GtkFormView >> invalidateRect: damageRect [

	self updateSurfaceRectangle: damageRect.
	self queueDrawArea: damageRect
]

{ #category : #private }
GtkFormView >> resizeIfEnabledTo: extent [

	self world worldState worldRenderer checkForNewScreenSize
]

{ #category : #'private updating' }
GtkFormView >> updateSurface [

	surface := GtkCairoSurface fromForm: form.
]

{ #category : #'private updating' }
GtkFormView >> updateSurfaceRectangle: aRect [
	| newSurface origin newForm aCr|

	surface ifNil: [ self updateSurface ].

	origin := aRect origin.

	newForm := Form extent: aRect extent depth: 32.
	newForm 
		copy: (0@0 extent: aRect extent)
		from: origin 
		in: self form 
		rule: Form over.

	newSurface := GtkCairoSurface fromForm: newForm.
	aCr := self cairoCreate: surface.

	self 
		setSourceSurfaceTo: aCr
		surface: newSurface getHandle
		x: origin x asFloat
		y: origin y asFloat.
	
	self paint: aCr.
	
	self cairoDestroy: aCr.
	
]

{ #category : #accessing }
GtkFormView >> world [ 

	^ self eventHandler morphicWorld
]
