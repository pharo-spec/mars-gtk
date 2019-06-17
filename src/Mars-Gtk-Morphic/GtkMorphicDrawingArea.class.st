"
I'm a base morphic drawing area. 
I define common behaviour for my children. They will be resposibly to draw Morphs or other morphic related elements (like GtkFormView, used to display a full World).
"
Class {
	#name : #GtkMorphicDrawingArea,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'activeSurface',
		'eventHandler',
		'drawQueued',
		'damageRecorder'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #examples }
GtkMorphicDrawingArea class >> example1 [

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
GtkMorphicDrawingArea class >> example2 [
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
GtkMorphicDrawingArea class >> example3 [
	| morph |

	GtkApplication ensureRunning.

	morph  := self 
		newGridOf: 10 
		with: [ | cell |
			(cell := Morph new)
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
GtkMorphicDrawingArea class >> example4 [
	| morph1 morph2 |

	GtkApplication ensureRunning.

	morph1 := self 
		newGridOf: 10
		with: [ | cell |
			(cell := Morph new)
				color: Color blue;
				on: #mouseEnter send: #value: to: [ :event | cell color: Color red ];
				on: #mouseLeave send: #value: to: [ :event | cell color: Color blue ] ].
	morph2 := self 
		newGridOf: 10 
		with: [ | cell | 
			(cell := Morph new)
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
GtkMorphicDrawingArea class >> example5 [
	| morph inform |

	GtkApplication ensureRunning.

	inform := GtkInfoArea new.

	morph  := self 
		newGridOf: 5 
		with: [ :pos | 
			PluggableButtonMorph new
				label: pos asString;
				actionBlock: [ inform addInfo: pos asString ];
				yourself ].

	GtkWindow new
		title: 'Example 5';
		resize: 500@500;
		add: (GtkBox newVertical
			packStart: inform expand: false fill: false padding: 0;
			packStart: (GtkMorphView newMorph: morph);
			yourself);
		showAll
]

{ #category : #examples }
GtkMorphicDrawingArea class >> example6 [
	| morph inform |

	GtkApplication ensureRunning.

	inform := GtkInfoArea new.

	morph  := self 
		newGridOf: 5 
		with: [ :pos | 
			PluggableButtonMorph new
				label: pos asString;
				actionBlock: [ inform addInfo: pos asString ];
				helpText: 'Button at ', pos asString;
				yourself ].

	GtkWindow new
		title: 'PlugabbleButtonMorph Event Example';
		resize: 500@500;
		add: (GtkBox newVertical
			packStart: inform expand: false fill: false padding: 0;
			packStart: (GtkMorphView newMorph: morph);
			yourself);
		showAll
]

{ #category : #examples }
GtkMorphicDrawingArea class >> example7 [
	| morph inform |

	GtkApplication ensureRunning.

	inform := GtkInfoArea new.

	morph  := self 
		newGridOf: 5 
		with: [ :pos | 
			SimpleButtonMorph new
				label: pos asString;
				color: Color random;
				target: [ inform addInfo: pos asString ];
				actionSelector: #value;
				helpText: 'Button at ', pos asString;
				yourself ].

	GtkWindow new
		title: 'SimpleButtonMorph Event Example';
		resize: 500@500;
		add: (GtkBox newVertical
			packStart: inform expand: false fill: false padding: 0;
			packStart: (GtkMorphView newMorph: morph);
			yourself);
		showAll
]

{ #category : #examples }
GtkMorphicDrawingArea class >> example8 [
	| morph1 morph2 inform |

	GtkApplication ensureRunning.

	inform := GtkInfoArea new.

	morph1  := self 
		newGridOf: 5 
		with: [ :pos | 
			SimpleButtonMorph new
				label: pos asString;
				color: Color random;
				target: [ inform addInfo: pos asString ];
				actionSelector: #value;
				helpText: 'Button at ', pos asString;
				yourself ].

	morph2  := self 
		newGridOf: 5 
		with: [ :pos | 
			SimpleButtonMorph new
				label: pos asString;
				color: Color random;
				target: [ inform addInfo: pos asString ];
				actionSelector: #value;
				helpText: 'Button at ', pos asString;
				yourself ].

	GtkWindow new
		title: 'SimpleButtonMorph Event Example';
		resize: 500@500;
		add: (GtkBox newVertical
			packStart: inform expand: false fill: false padding: 0;
			packStart: (GtkPaned newVertical
				position: 250;
				add: (GtkMorphView newMorph: morph1);
				add: (GtkMorphView newMorph: morph2);
				yourself);
			yourself);
		showAll
]

{ #category : #examples }
GtkMorphicDrawingArea class >> newGridOf: aNumber with: aBlock [
	| gridMorph |

	(gridMorph := Morph new)
		color: Color transparent;
		layoutPolicy: TableLayout new;
		borderWidth: 10;
		cellInset: 10;
		listDirection: #topToBottom;
		vResizing: #spaceFill; 
		hResizing: #spaceFill.

	1 to: aNumber do: [ :y | | row |
		row := (Morph new color: Color transparent).
		row
			layoutPolicy: TableLayout new;
			listDirection: #leftToRight;
			cellInset: 10;
			vResizing: #spaceFill; 
			hResizing: #spaceFill.
		1 to: aNumber do: [ :x | |  cell |
			cell := aBlock cull: x@y.
			cell
				vResizing: #spaceFill; 
				hResizing: #spaceFill. 
			row addMorphBack: cell ].
		gridMorph addMorphBack: row ].
	
	^ gridMorph
]

{ #category : #private }
GtkMorphicDrawingArea >> activeSurface [
	
	^ activeSurface
]

{ #category : #private }
GtkMorphicDrawingArea >> activeSurface: aSurface [

	activeSurface := aSurface
]

{ #category : #'private primitives' }
GtkMorphicDrawingArea >> cairoCreate: target [

	^ self 
		ffiCall: #("cairo_t"void *cairo_create ("cairo_surface_t"void *target))
		module: CairoLibrary
]

{ #category : #'private primitives' }
GtkMorphicDrawingArea >> cairoDestroy: cr [

	^ self 
		ffiCall: #(void cairo_destroy ("cairo_t *"void *cr))
		module: CairoLibrary
]

{ #category : #private }
GtkMorphicDrawingArea >> canDraw [

	self subclassResponsibility
]

{ #category : #initialization }
GtkMorphicDrawingArea >> connectToSignals [

	self connectSizeAllocate: [ :aRect | self resizeIfEnabledTo: aRect extent ].
	self connectEvent: [ :event | self handleEvent: event ]
]

{ #category : #private }
GtkMorphicDrawingArea >> currentExtent [

	self subclassResponsibility
]

{ #category : #drawing }
GtkMorphicDrawingArea >> draw: cr [

	(drawing or: [ self canDraw not ]) ifTrue: [ ^ true ].

	drawing := true.	
	[
		self needUpdate ifTrue: [ 
			self updateSurface ].
		self setSourceSurfaceTo: cr surface: activeSurface getHandle.
		self paint: cr ]
	ensure: [ 
		drawing := false.
		drawQueued := false ].

	^ true
]

{ #category : #drawing }
GtkMorphicDrawingArea >> drawOnAthensCanvas: aCanvas [
	
	"do nothing"
]

{ #category : #private }
GtkMorphicDrawingArea >> eventHandler [

	^ eventHandler
]

{ #category : #accessing }
GtkMorphicDrawingArea >> eventHandler: aHandler [

	eventHandler := aHandler
]

{ #category : #'private events' }
GtkMorphicDrawingArea >> handleEvent: event [

	event isEventConfigure ifTrue: [ 
		event extent = self currentExtent ifFalse: [ 
			self invalidate.
			^ true  ] ].
	^ eventHandler handleEvent: event
]

{ #category : #initialization }
GtkMorphicDrawingArea >> initialize [ 

	super initialize.
	drawQueued := false.
	drawing := false.

	self registerToAllEvents.
	self canFocus: true.
	self connectToSignals.
	
	damageRecorder := DamageRecorder new	

]

{ #category : #accessing }
GtkMorphicDrawingArea >> invalidate [

	self invalidate: true
]

{ #category : #private }
GtkMorphicDrawingArea >> invalidate: needQueue [

	damageRecorder doFullRepaint.
	needQueue ifTrue: [ self queueDraw ]
]

{ #category : #accessing }
GtkMorphicDrawingArea >> invalidateRect: damageRect [

	damageRecorder recordInvalidRect: damageRect.
	self queueDraw

]

{ #category : #testing }
GtkMorphicDrawingArea >> needUpdate [

	^ damageRecorder updateIsNeeded
]

{ #category : #'private primitives' }
GtkMorphicDrawingArea >> paint: cr [

	self 
		ffiCall: #(void cairo_paint (void *cr))
		module: CairoLibrary
]

{ #category : #private }
GtkMorphicDrawingArea >> queueDraw [
	
	(drawing or: [ drawQueued ]) ifTrue: [ ^ self ].
	drawQueued := true.
	super queueDraw
]

{ #category : #private }
GtkMorphicDrawingArea >> resizeIfEnabledTo: extent [

	self subclassResponsibility
]

{ #category : #'private primitives' }
GtkMorphicDrawingArea >> setSourceSurfaceTo: cr surface: surface [

	self 
		setSourceSurfaceTo: cr 
		surface: surface 
		x: 0.0 
		y: 0.0
]

{ #category : #'private primitives' }
GtkMorphicDrawingArea >> setSourceSurfaceTo: cr surface: surface x: x y: y [

	self 
		ffiCall: #(void cairo_set_source_surface (void *cr, void *surface, double x,  double y))
		module: CairoLibrary
]

{ #category : #'private updating' }
GtkMorphicDrawingArea >> updateAllSurface [

	self subclassResponsibility
]

{ #category : #'private updating' }
GtkMorphicDrawingArea >> updateSurface [
	| rects |
	
	self flag: #TODO. "Do not use the nil HACK here (add a method to DamageRecorder to know if 
	I need to redraw all instead)."
	rects := damageRecorder invalidRectsFullBounds: nil.
	damageRecorder reset.
	rects first 
		ifNotNil: [ self updateSurfaceRectangles: rects ]
		ifNil: [ self updateAllSurface ]
]

{ #category : #'private updating' }
GtkMorphicDrawingArea >> updateSurfaceRectangles: rects [

	self subclassResponsibility
]

{ #category : #accessing }
GtkMorphicDrawingArea >> world [ 

	self subclassResponsibility
]
