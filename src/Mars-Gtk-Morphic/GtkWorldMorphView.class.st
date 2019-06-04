Class {
	#name : #GtkWorldMorphView,
	#superclass : #GtkMorphicDrawingArea,
	#instVars : [
		'world',
		'form'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #private }
GtkWorldMorphView class >> drawingAreaNew [

	^ self ffiCall: #(GtkWorldMorphView *gtk_drawing_area_new ())
]

{ #category : #examples }
GtkWorldMorphView class >> example [
	| world view |

	GtkApplication ensureRunning.

	world := WorldMorph new.
	
	view := self newWorld: world.
	WorldMorph addExtraWorld: world.
	world changed.
			
	GtkWindow new 
		title: 'World example';
		add: (GtkScrolledWindow newWidget: view);
		connectHide: [ WorldMorph removeExtraWorld: world ];
		showAll
]

{ #category : #'instance creation' }
GtkWorldMorphView class >> new [

	self error: 'Use #newWorld:'
]

{ #category : #'instance creation' }
GtkWorldMorphView class >> newWorld: aWorld [

	^ self drawingAreaNew
		initialize;
		world: aWorld;
		yourself
]

{ #category : #private }
GtkWorldMorphView >> canDraw [

	^ true
]

{ #category : #private }
GtkWorldMorphView >> currentExtent [

	^ self world extent
]

{ #category : #accessing }
GtkWorldMorphView >> form [

	^ form ifNil: [ form := self world display ]
]

{ #category : #accessing }
GtkWorldMorphView >> form: aForm [

	form := aForm
]

{ #category : #private }
GtkWorldMorphView >> resizeIfEnabledTo: extent [

	self flag: #TODO.
]

{ #category : #'private updating' }
GtkWorldMorphView >> updateAllSurface [
		
	self activeSurface: (AthensCairoSurface fromForm: (self form asFormOfDepth: 32))
]

{ #category : #'private updating' }
GtkWorldMorphView >> updateSurfaceRectangle: aRect [
	| intersection newForm newSurface cr |
	
	intersection := aRect
		intersect: (0 @ 0 corner: self world extent)
		ifNone: [ ^ self ].
		
	newForm := Form extent: intersection extent depth: 32.
	(BitBlt toForm: newForm)
		colorMap: nil;
		copy: intersection
		from: intersection origin in: self form
		fillColor: nil 
		rule: Form over.
		
	newSurface := AthensCairoSurface fromForm: newForm.
	cr := self cairoCreate: self activeSurface getHandle.
	[
		self 
			setSourceSurfaceTo: cr 
			surface: newSurface getHandle
			x: intersection origin x asFloat
			y: intersection origin y asFloat.
		self paint: cr ]
	ensure: [ 
		self cairoDestroy: cr ]
]

{ #category : #'private updating' }
GtkWorldMorphView >> updateSurfaceRectangles: rects [

	rects do: [ :each | 
		self updateSurfaceRectangle: each ]
]

{ #category : #accessing }
GtkWorldMorphView >> world [ 

	^ world
]

{ #category : #accessing }
GtkWorldMorphView >> world: aWorldMorph [

	world := aWorldMorph
]
