"
I'm a base morphic drawing area. 
I define common behaviour for my children. They will be resposibly to draw Morphs or other morphic related elements (like GtkFormView, used to display a full World).
"
Class {
	#name : #GtkMorphicDrawingArea,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'eventHandler'
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

{ #category : #'private primitives' }
GtkMorphicDrawingArea >> cairoRectangle: aCr x: xValue y: yValue	width: aWidth height: aHeight [

	self 
		ffiCall: #(void cairo_rectangle (void *aCr,
                 double xValue,
                 double yValue,
                 double aWidth,
                 double aHeight))
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

	self subclassResponsibility
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

	self registerToAllEvents.
	self canFocus: true.
	self connectToSignals
]

{ #category : #accessing }
GtkMorphicDrawingArea >> invalidate [

	self subclassResponsibility
]

{ #category : #accessing }
GtkMorphicDrawingArea >> invalidateRect: damageRect [

	self subclassResponsibility
]

{ #category : #'private primitives' }
GtkMorphicDrawingArea >> paint: cr [

	self 
		ffiCall: #(void cairo_paint (void *cr))
		module: CairoLibrary
]

{ #category : #accessing }
GtkMorphicDrawingArea >> queueDraw [
	
	"(drawing or: [ drawQueued ]) ifTrue: [ ^ self ].
	drawQueued := true."
	super queueDraw
]

{ #category : #accessing }
GtkMorphicDrawingArea >> queueDrawArea: rect [

	"(drawing or: [ drawQueued ]) ifTrue: [ ^ self ].
	drawQueued := true."
	super queueDrawArea: rect
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
		ffiCall: #(void cairo_set_source_surface (void *cr, void *surface, double x, double y))
		module: CairoLibrary
]

{ #category : #'private updating' }
GtkMorphicDrawingArea >> updateSurface [

	self subclassResponsibility
]

{ #category : #accessing }
GtkMorphicDrawingArea >> world [ 

	self subclassResponsibility
]
