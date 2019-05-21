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
		'queued',
		'activeHand'
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
	| morph positionMorph |
	"show mouse events"
	GtkApplication ensureRunning.

	morph := Morph new.
	morph addMorphBack: (positionMorph := StringMorph contents: '[Position]').
	morph 
		on: #mouseMove 
		send: #value:
		to: [ :event | positionMorph contents: event position asString ].

	GtkWindow new
		title: 'Mouse-move test';
		resize: 500@500;
		add: (GtkBox newVertical 
			packStart: (GtkMorphView newMorph: morph);
			yourself);
		showAll
]

{ #category : #examples }
GtkMorphView class >> example3 [
	| morph |

	GtkApplication ensureRunning.

	morph  := self 
		newGridOf: 10 
		with: [ :cell | 
			cell 
				color: Color blue;
				on: #mouseEnter send: #value: to: [ :event | cell color: Color red ];
				on: #mouseLeave send: #value: to: [ :event | cell color: Color blue ] ].

	GtkWindow new
		title: 'Example 3';
		resize: 500@500;
		add: (GtkBox newVertical 
			packStart: (GtkMorphView newMorph: morph);
			yourself);
		showAll
]

{ #category : #examples }
GtkMorphView class >> example4 [
	| morph1 morph2 |

	GtkApplication ensureRunning.

	morph1 := self 
		newGridOf: 10 
		with: [ :cell | 
			cell 
				color: Color blue;
				on: #mouseEnter send: #value: to: [ :event | cell color: Color red ];
				on: #mouseLeave send: #value: to: [ :event | cell color: Color blue ] ].
	morph2 := self 
		newGridOf: 10 
		with: [ :cell | 
			cell 
				color: Color green;
				on: #mouseEnter send: #value: to: [ :event | cell color: Color red ];
				on: #mouseLeave send: #value: to: [ :event | cell color: Color green ] ].


	GtkWindow new
		title: 'Example 4';
		resize: 500@500;
		add: (GtkPaned newVertical 
			pack1: (GtkMorphView newMorph: morph1);
			pack2: (GtkMorphView newMorph: morph2);
			yourself);
		showAll
]

{ #category : #examples }
GtkMorphView class >> newGridOf: aNumber with: aBlock [
	| gridMorph |

	(gridMorph := Morph new)
		color: Color transparent;
		layoutPolicy: TableLayout new;
		borderWidth: 10;
		cellInset: 10;
		listDirection: #topToBottom;
		vResizing: #spaceFill; 
		hResizing: #spaceFill.

	aNumber timesRepeat: [ | row |
		row := (Morph new color: Color transparent).
		row
			layoutPolicy: TableLayout new;
			listDirection: #leftToRight;
			cellInset: 10;
			vResizing: #spaceFill; 
			hResizing: #spaceFill.
		aNumber timesRepeat: [ | cell |
			cell := Morph new.
			cell
				vResizing: #spaceFill; 
				hResizing: #spaceFill. 
			row addMorphBack: cell.
			aBlock value: cell ].
		gridMorph addMorphBack: row ].
	
	^ gridMorph
]

{ #category : #'instance creation' }
GtkMorphView class >> newMorph: aMorph [
	^ self new 
		morph: aMorph;
		yourself

]

{ #category : #'world simulation' }
GtkMorphView >> activeHand [
	
	^ activeHand ifNil: [ 
		activeHand := HandMorph new 
			privateOwner: self;
			yourself ]
]

{ #category : #'world simulation' }
GtkMorphView >> addAlarm: aSelector withArguments: argArray for: aTarget at: scheduledTime [
	
	self flag: #TODO.
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
		self setSourceSurfaceTo: cr surface: activeSurface getHandle.
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

{ #category : #'private primitives' }
GtkMorphView >> paint: cr [

	self 
		ffiCall: #(void cairo_paint (void *cr))
		module: CairoLibrary
]

{ #category : #'world simulation' }
GtkMorphView >> processEvent: anEvent [
 
	^ self morph processEvent: anEvent
]

{ #category : #private }
GtkMorphView >> queueDraw [
	
	drawing ifTrue: [ ^ self ].
	queued ifTrue: [ ^ self ].
	queued := true.
	
	self resetSurface.
	super queueDraw.
]

{ #category : #'world simulation' }
GtkMorphView >> removeAlarm: aSelector for: aTarget [
	
	self flag: #TODO.
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

{ #category : #'private primitives' }
GtkMorphView >> setSourceSurfaceTo: cr surface: surface [

	self 
		setSourceSurfaceTo: cr 
		surface: surface 
		x: 0.0 
		y: 0.0
]

{ #category : #'private primitives' }
GtkMorphView >> setSourceSurfaceTo: cr surface: surface x: x y: y [

	self 
		ffiCall: #(void cairo_set_source_surface (void *cr, void *surface, double x,  double y))
		module: CairoLibrary
]

{ #category : #'world simulation' }
GtkMorphView >> transformFrom: aMorph [ 
	
	^ IdentityTransform new
]

{ #category : #'world simulation' }
GtkMorphView >> world [

	^ self
]
