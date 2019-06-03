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

{ #category : #examples }
GtkFormView class >> example1 [

	GtkApplication ensureRunning.
	
	GtkWindow new 
		resize: 500@500;
		add: (GtkPaned newHorizontal
			pack1: (GtkLabel newLabel: 'Label');
			pack2: (GtkFormView newForm: (self iconNamed: #smallOk));
			yourself);
		showAll
]

{ #category : #'instance creation' }
GtkFormView class >> newForm: aForm [

	^ self new
		form: aForm;
		yourself
]

{ #category : #private }
GtkFormView >> canDraw [

	^ self form notNil
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

	self flag: #TODO.
]

{ #category : #'private updating' }
GtkFormView >> updateAllSurface [
		
	self activeSurface: (AthensCairoSurface fromForm: (self form asFormOfDepth: 32))
]

{ #category : #'private updating' }
GtkFormView >> updateSurfaceRectangle: aRect [
	| intersection newForm newSurface cr |
	
	intersection := aRect
		intersect: (0 @ 0 corner: self form extent)
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
GtkFormView >> updateSurfaceRectangles: rects [

	rects do: [ :each | 
		self updateSurfaceRectangle: each ]
]
