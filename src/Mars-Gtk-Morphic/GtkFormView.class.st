"
I'm a widget to display a world contained in a Form.
Being a Form a bitmap, this component could be used to display any kind of Form, containded in a World (provided through the event handler).
"
Class {
	#name : #GtkFormView,
	#superclass : #GtkMorphicDrawingArea,
	#instVars : [
		'form',
		'cr'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #private }
GtkFormView class >> drawingAreaNew [

	^ self ffiCall: #(GtkFormView *gtk_drawing_area_new ())
]

{ #category : #accessing }
GtkFormView >> activeSurface: aSurface [ 

	super activeSurface: aSurface.
	"cr ifNotNil: [ 
		self cairoDestroy: cr ].
	cr := self cairoCreate: aSurface getHandle"
]

{ #category : #private }
GtkFormView >> canDraw [

	^ true
]

{ #category : #'private updating' }
GtkFormView >> clipRectangle [
	| rect |
	
	rect := GdkRectangle new.
	self getClipRectangle: rect.
	^ rect asRectangle
]

{ #category : #private }
GtkFormView >> currentExtent [

	^ self form extent
]

{ #category : #drawing }
GtkFormView >> draw: aCr [

	[ 	cr := aCr. 
		self updateSurface ] 
	ensure: [ 
		cr := nil ].

	^ true
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
GtkFormView >> getClipRectangle: rect [
	
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
GtkFormView >> getTarget [
	
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

	self queueDraw
]

{ #category : #accessing }
GtkFormView >> invalidateRect: damageRect [

	self queueDrawArea: damageRect
]

{ #category : #private }
GtkFormView >> resizeIfEnabledTo: extent [

	self world worldState worldRenderer checkForNewScreenSize
]

{ #category : #'private updating' }
GtkFormView >> updateSurface [

	self updateSurfaceRectangle: self clipRectangle
]

{ #category : #'private updating' }
GtkFormView >> updateSurfaceRectangle: aRect [
	| newSurface origin newForm|

	origin := aRect origin.

	newForm := Form extent: aRect extent depth: 32.
	newForm 
		copy: (0@0 extent: aRect extent)
		from: origin 
		in: self form 
		rule: Form over.

	newSurface := GtkFormCairoSurface fromForm: newForm.
	self 
		setSourceSurfaceTo: cr
		surface: newSurface getHandle
		x: origin x asFloat
		y: origin y asFloat.
	self paint: cr
]

{ #category : #accessing }
GtkFormView >> world [ 

	^ self eventHandler morphicWorld
]
