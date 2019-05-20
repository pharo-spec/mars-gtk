"
I'm a widget to display morphs. 
"
Class {
	#name : #GtkMorphView,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'morph',
		'activeSurface',
		'morphResizable',
		'eventHandler',
		'queued'
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
		title: 'Mouse-move test';
		resize: 500@500;
		add: (GtkBox newVertical 
			packStart: (GtkMorphView newMorph: (GtkExampleTraceMovementMorph new));
			yourself);
		showAll
]

{ #category : #examples }
GtkMorphView class >> example3 [
	| m |

	GtkApplication ensureRunning.

	m := Morph new.
	m 
		color: Color transparent;
		layoutPolicy: TableLayout new;
		cellInset: 10;
		listDirection: #topToBottom;
		vResizing: #spaceFill; 
		hResizing: #spaceFill.

	10 timesRepeat: [ | row |
		row := (Morph new color: Color transparent).
		row
			layoutPolicy: TableLayout new;
			listDirection: #leftToRight;
			cellInset: 10;
			vResizing: #spaceFill; 
			hResizing: #spaceFill.
		10 timesRepeat: [ | cell |
			cell := (Morph new color: Color random).
			cell
				vResizing: #spaceFill; 
				hResizing: #spaceFill. 
			row addMorphBack: cell ].
		m addMorphBack: row ].

	GtkWindow new
		title: 'Mouse-move test';
		resize: 500@500;
		add: (GtkBox newVertical 
			packStart: (GtkMorphView newMorph: m);
			yourself);
		showAll
]

{ #category : #'instance creation' }
GtkMorphView class >> newMorph: aMorph [
	^ self new 
		morph: aMorph;
		yourself

]

{ #category : #'world simulation' }
GtkMorphView >> activeHand [
	
	^ ActiveHand
]

{ #category : #'world simulation' }
GtkMorphView >> beCursorOwner [
	
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

	self connectSizeAllocate: [ :aRect | self resizeIfEnabledTo: aRect extent ].
	self connectEvent: [ :event | self handleEvent: event ]
]

{ #category : #drawing }
GtkMorphView >> draw: cr [

	drawing ifTrue: [ ^ true ].
	drawing := true.
	
	[
		self 
			setSourceSurfaceTo: cr
			surface: activeSurface getHandle
			x: 0.0 
			y: 0.0.
		self paint: cr ] 
	ensure: [ 
		drawing := false.
		queued := false ].

	^ true
]

{ #category : #drawing }
GtkMorphView >> drawOnAthensCanvas: aCanvas [
	
	"do nothing"
]

{ #category : #'private events' }
GtkMorphView >> handleEvent: event [

	^ eventHandler handleEvent: event
]

{ #category : #initialization }
GtkMorphView >> initialize [ 

	super initialize.
	queued := false.
	drawing := false.
	self beMorphResizable.
	self registerToAllEvents.
	self connectToSignals.
]

{ #category : #'world simulation' }
GtkMorphView >> invalidRect: damageRect from: aMorph [

	self queueDraw
]

{ #category : #testing }
GtkMorphView >> isMorphResizable [

	^ morphResizable
]

{ #category : #'world simulation' }
GtkMorphView >> layoutChanged [

	self queueDraw
]

{ #category : #accessing }
GtkMorphView >> morph [

	^ morph
]

{ #category : #accessing }
GtkMorphView >> morph: aMorph [

	morph := aMorph.
	eventHandler := GtkMorphicEventHandler for: self.
	eventHandler morph: aMorph.
	morph privateOwner: self.
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
GtkMorphView >> queueDraw [
	
	drawing ifTrue: [ ^ self ].
	queued ifTrue: [ ^ self ].
	queued := true.
	
	self resetSurface.
	super queueDraw.
]

{ #category : #private }
GtkMorphView >> resetSurface [

	activeSurface := self newMorphSurface
]

{ #category : #private }
GtkMorphView >> resizeIfEnabledTo: extent [

	self isMorphResizable ifFalse: [ ^ self ]. 
			
	self morph extent: extent.
	self resetSurface
]

{ #category : #private }
GtkMorphView >> setSourceSurfaceTo: cr surface: surface x: x y: y [

	self 
		ffiCall: #(void cairo_set_source_surface (void *cr, void *surface, double x,  double y))
		module: CairoLibrary
]
