Class {
	#name : #GtkFormView,
	#superclass : #GtkMorphicDrawingArea,
	#instVars : [
		'form'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #private }
GtkFormView class >> drawingAreaNew [

	^ self ffiCall: #(GtkFormView *gtk_drawing_area_new ())
]

{ #category : #private }
GtkFormView >> canDraw [

	^ true
]

{ #category : #private }
GtkFormView >> currentExtent [

	^ self form extent
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

{ #category : #private }
GtkFormView >> resizeIfEnabledTo: extent [

	self world checkNewWindowSize
]

{ #category : #'private updating' }
GtkFormView >> updateAllSurface [
		
	self activeSurface: (AthensCairoSurface fromForm: (self form asFormOfDepth: 32))
]

{ #category : #'private updating' }
GtkFormView >> updateSurfaceRectangle: aRect [
	| newForm newSurface cr origin |

	origin := aRect origin.
	newForm := Form extent: aRect extent depth: 32.
	newForm 
		copy: (0@0 extent: aRect extent)
		from: origin 
		in: self form 
		rule: Form over.
		
	newSurface := AthensCairoSurface fromForm: newForm.
	cr := self cairoCreate: self activeSurface getHandle.
	[
		self 
			setSourceSurfaceTo: cr 
			surface: newSurface getHandle
			x: origin x asFloat
			y: origin y asFloat.
		self paint: cr ]
	ensure: [ 
		self cairoDestroy: cr ]
]

{ #category : #'private updating' }
GtkFormView >> updateSurfaceRectangles: rects [

	rects do: [ :eachRect |
		self updateSurfaceRectangle: eachRect ]
]

{ #category : #accessing }
GtkFormView >> world [ 

	^ self eventHandler morphicWorld
]
