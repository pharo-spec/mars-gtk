"
I'm a widget to display morphs. 
"
Class {
	#name : #GtkMorphView,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'morph',
		'activeSurface'
	],
	#pools : [
		'GdkEventMask'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #private }
GtkMorphView class >> drawingAreaNew [
	^ self ffiCall: #(GtkMorphView *gtk_drawing_area_new ())
]

{ #category : #examples }
GtkMorphView class >> example [ 

	GtkApplication ensureRunning.
	
	GtkWindow new 
		resize: 500@500;
		add: (GtkPaned newHorizontal
			pack1: (GtkLabel newLabel: 'Label');
			pack2: (GtkMorphView newMorph: (Morph new));
			yourself);
		showAll
]

{ #category : #'instance creation' }
GtkMorphView class >> newMorph: aMorph [
	^ self new 
		morph: aMorph;
		yourself

]

{ #category : #drawing }
GtkMorphView >> basicDraw: cr [

	self 
		setSourceSurfaceTo: cr
		surface: activeSurface getHandle
		x: 0.0 
		y: 0.0.
	self paint: cr
]

{ #category : #drawing }
GtkMorphView >> draw: cr [

	self basicDraw: cr.
	^ true
]

{ #category : #drawing }
GtkMorphView >> drawOnAthensCanvas: aCanvas [
	
	"do nothing"
]

{ #category : #private }
GtkMorphView >> events: events [
	
	self ffiCall: #(void gtk_widget_set_events (self, gint events))
]

{ #category : #initialization }
GtkMorphView >> initialize [ 

	super initialize.
	self events: GDK_ALL_EVENTS_MASK value
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
