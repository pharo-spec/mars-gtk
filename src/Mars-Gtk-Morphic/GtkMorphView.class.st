"
I'm a widget to display morphs. 
"
Class {
	#name : #GtkMorphView,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'morph',
		'activeSurface',
		'morphResizable'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #private }
GtkMorphView class >> drawingAreaNew [
	^ self ffiCall: #(GtkMorphView *gtk_drawing_area_new ())
]

{ #category : #examples }
GtkMorphView class >> example1 [

	GtkApplication ensureRunning.
	
	GtkWindow new 
		resize: 500@500;
		add: (GtkPaned newHorizontal
			pack1: (GtkLabel newLabel: 'Label');
			pack2: (GtkMorphView newMorph: (Morph new
				addMorphBack: 'Test' asStringMorph;
				yourself));
			yourself);
		showAll
]

{ #category : #examples }
GtkMorphView class >> example2 [
	"show mouse events"
	GtkApplication ensureRunning.

	GtkWindow new
		resize: 500@500;
		add: (GtkBox newVertical 
			packStart: (GtkMorphView newMorph: (GtkTraceMovementMorph new));
			yourself);
		showAll
]

{ #category : #'instance creation' }
GtkMorphView class >> newMorph: aMorph [
	^ self new 
		morph: aMorph;
		yourself

]

{ #category : #accessing }
GtkMorphView >> beMorphNotResizable [

	self morphResizable: false
]

{ #category : #accessing }
GtkMorphView >> beMorphResizable [

	self morphResizable: true
]

{ #category : #initialization }
GtkMorphView >> connectToSignals [

	self connectSizeAllocate: [ :aRect |
		self isMorphResizable ifTrue: [ 
			self morph extent: aRect extent.
			self resetSurface ] ]
]

{ #category : #drawing }
GtkMorphView >> draw: cr [

	self 
		setSourceSurfaceTo: cr
		surface: activeSurface getHandle
		x: 0.0 
		y: 0.0.
	self paint: cr.
	
	^ true
]

{ #category : #drawing }
GtkMorphView >> drawOnAthensCanvas: aCanvas [
	
	"do nothing"
]

{ #category : #initialization }
GtkMorphView >> initialize [ 

	super initialize.
	self beMorphResizable.
	self registerToAllEvents.
	self connectToSignals.
]

{ #category : #testing }
GtkMorphView >> isMorphResizable [

	^ morphResizable
]

{ #category : #accessing }
GtkMorphView >> morph [

	^ morph
]

{ #category : #accessing }
GtkMorphView >> morph: aMorph [

	morph := aMorph.
	activeSurface := self newMorphSurface.
	self sizeRequest: aMorph extent
]

{ #category : #private }
GtkMorphView >> morphResizable: aBoolean [

	morphResizable := aBoolean
]

{ #category : #private }
GtkMorphView >> newMorphSurface [
	| newSurface |

	newSurface := AthensCairoSurface extent: self morph extent.
	newSurface drawDuring: [ :canvas |
		self morph fullDrawOnAthensCanvas: canvas ].
	^ newSurface
]

{ #category : #private }
GtkMorphView >> paint: cr [

	self 
		ffiCall: #(void cairo_paint (void *cr))
		module: CairoLibrary
]

{ #category : #private }
GtkMorphView >> resetSurface [

	activeSurface := self newMorphSurface
]

{ #category : #private }
GtkMorphView >> setIoProcessSuspended: suspended [

	self 
		ffiCall: #(void setIoProcessSuspended(int suspended)) 
		module: VMFFILibrary
]

{ #category : #private }
GtkMorphView >> setSourceSurfaceTo: cr surface: surface x: x y: y [

	self 
		ffiCall: #(void cairo_set_source_surface (void *cr, void *surface, double x,  double y))
		module: CairoLibrary
]

{ #category : #private }
GtkMorphView >> suspendIOEventsDuring: aBlock [ 

	self setIoProcessSuspended: 1.
	aBlock ensure: [ 
		self setIoProcessSuspended: 0 ]
]
