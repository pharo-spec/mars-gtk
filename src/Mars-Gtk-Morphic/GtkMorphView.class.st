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
		'activeHand',
		'damageRecorder',
		'alarms',
		'steps',
		'layeredMorphs'
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
GtkMorphView class >> example4 [
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
GtkMorphView class >> example5 [
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
GtkMorphView class >> example6 [
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
		title: 'Example 5';
		resize: 500@500;
		add: (GtkBox newVertical
			packStart: inform expand: false fill: false padding: 0;
			packStart: (GtkMorphView newMorph: morph);
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
	"Add a new alarm with the given set of parameters"
	| newAlarm |

	newAlarm := GtkMorphicAlarm 
		scheduledAt: scheduledTime
		receiver: aTarget
		selector: aSelector
		arguments: argArray.

	alarms ifNil: [ alarms := Set new ].
	alarms add: newAlarm.
	
	newAlarm schedule
]

{ #category : #'world simulation' }
GtkMorphView >> addMorphFront: aMorph [
	
	self addMorphInFrontOfLayer: aMorph
]

{ #category : #'world simulation' }
GtkMorphView >> addMorphInFrontOfLayer: aMorph [

	layeredMorphs add: aMorph.
	aMorph privateOwner: self.

	self invalidateRect: aMorph fullBounds
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

{ #category : #'world simulation' }
GtkMorphView >> becomeActiveDuring: aBlock [
	
	aBlock value
]

{ #category : #'world simulation' }
GtkMorphView >> bounds [ 

	^ self morph bounds
]

{ #category : #'private primitives' }
GtkMorphView >> cairoCreate: target [

	^ self 
		ffiCall: #("cairo_t"void *cairo_create ("cairo_surface_t"void *target))
		module: CairoLibrary
]

{ #category : #'private primitives' }
GtkMorphView >> cairoDestroy: cr [

	^ self 
		ffiCall: #(void cairo_destroy ("cairo_t *"void *cr))
		module: CairoLibrary
]

{ #category : #initialization }
GtkMorphView >> connectToSignals [

	self connectSizeAllocate: [ :aRect | self resizeIfEnabledTo: aRect extent ].
	self connectEvent: [ :event | self handleEvent: event ]
]

{ #category : #'world simulation' }
GtkMorphView >> currentCursor [
	
	self flag: #TODO. "cursor handling"
	^ nil
]

{ #category : #drawing }
GtkMorphView >> draw: cr [

	(drawing or: [ self morph isNil ]) ifTrue: [ ^ true ].

	drawing := true.	
	[
		damageRecorder updateIsNeeded 
			ifTrue: [ self updateSurface ].
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

	self morph ifNil: [ ^ false ].

	event isEventConfigure ifTrue: [ 
		event extent = self morph extent ifFalse: [ 
			self invalidate.
			^ true  ] ].
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
	
	eventHandler := GtkMorphicEventHandler for: self.
	damageRecorder := DamageRecorder new.
	layeredMorphs := OrderedCollection new: 1
]

{ #category : #'world simulation' }
GtkMorphView >> invalidRect: damageRect from: aMorph [

	self invalidateRect: damageRect
]

{ #category : #private }
GtkMorphView >> invalidate [

	self invalidate: true
]

{ #category : #private }
GtkMorphView >> invalidate: needQueue [

	damageRecorder doFullRepaint.
	needQueue ifTrue: [ self queueDraw ]
]

{ #category : #private }
GtkMorphView >> invalidateRect: damageRect [

	damageRecorder recordInvalidRect: damageRect.
	self queueDraw

]

{ #category : #testing }
GtkMorphView >> isMorphResizable [

	^ morphResizable
]

{ #category : #'world simulation' }
GtkMorphView >> layoutChanged [

]

{ #category : #accessing }
GtkMorphView >> morph [

	^ morph
]

{ #category : #accessing }
GtkMorphView >> morph: aMorph [
	| needQueue |

	needQueue := false.
	morph ifNotNil: [ 
		"if we are replacing a morph, we will need to transmit to the new morph some properties. 
		 Also, we will need to force a queue"
		(self isMorphResizable and: [ aMorph extent < morph extent ]) ifTrue: [ 
			aMorph extent: morph extent ].
		needQueue := true ].
	morph := aMorph.
	eventHandler morph: aMorph.
	morph privateOwner: self.
	
	self sizeRequest: aMorph extent.
	self invalidate: needQueue
]

{ #category : #private }
GtkMorphView >> morphResizable: aBoolean [

	morphResizable := aBoolean
]

{ #category : #private }
GtkMorphView >> newSurfaceOfMorph: aMorph [
	| newSurface |

	newSurface := AthensCairoSurface extent: aMorph extent.
	newSurface drawDuring: [ :canvas |
		canvas pathTransform translateBy: aMorph position negated.
		aMorph fullDrawOnAthensCanvas: canvas ].
	^ newSurface
]

{ #category : #'private primitives' }
GtkMorphView >> paint: cr [

	self 
		ffiCall: #(void cairo_paint (void *cr))
		module: CairoLibrary
]

{ #category : #'private updating' }
GtkMorphView >> paintMorph: aMorph [
	| cr position morphSurface |
	
	position := aMorph position.
	morphSurface := self newSurfaceOfMorph: aMorph.
	cr := self cairoCreate: activeSurface getHandle.
	[
		self 
			setSourceSurfaceTo: cr 
			surface: morphSurface getHandle
			x: position x asFloat
			y: position y asFloat.
		self paint: cr ]
	ensure: [ 
		self cairoDestroy: cr ]
]

{ #category : #'world simulation' }
GtkMorphView >> paneColorOrNil [
	
	^ nil
]

{ #category : #'world simulation' }
GtkMorphView >> processEvent: anEvent [
 
	^ self morph processEvent: anEvent
]

{ #category : #private }
GtkMorphView >> queueDraw [
	
	(drawing or: [ queued ]) ifTrue: [ ^ self ].
	queued := true.
	super queueDraw
]

{ #category : #'world simulation' }
GtkMorphView >> removeAlarm: aSelector for: aTarget [
	
	alarms ifNil: [ ^ self ].
	alarms
		detect: [ :each | 
			each receiver == aTarget 
			and: [ each selector == aSelector ] ]
		ifFound: [ :anAlarm | 
			anAlarm cancel.
			alarms remove: anAlarm ]
]

{ #category : #'world simulation' }
GtkMorphView >> removeMorph: aMorph [ 
	
	(layeredMorphs includes: aMorph) ifFalse: [ ^ self ].
	
	layeredMorphs remove: aMorph.
	self invalidateRect: aMorph fullBounds
]

{ #category : #private }
GtkMorphView >> resizeIfEnabledTo: extent [

	self isMorphResizable ifFalse: [ ^ self ].
	self morph ifNil: [ ^ self ].
	self morph extent: extent
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
GtkMorphView >> startStepping: aMorph [
	
	self 
		startStepping: aMorph 
		at: Time millisecondClockValue 
		selector: #stepAt: 
		arguments: nil 
		stepTime: nil
]

{ #category : #'world simulation' }
GtkMorphView >> startStepping: aMorph at: scheduledTime selector: aSelector arguments: args stepTime: stepTime [
	"Add the given morph to the step list. Do nothing if it is already being stepped."
	| newStep |

	self stopStepping: aMorph selector: aSelector.
	
	newStep := GtkStepMessage 
		scheduledAt: scheduledTime
		stepTime: stepTime
		receiver: aMorph
		selector: aSelector
		arguments: args.
		
	steps ifNil: [ steps := Set new ].
	steps add: newStep.
	
	newStep schedule
]

{ #category : #'world simulation' }
GtkMorphView >> stopStepping: aMorph selector: aSelector [
	
	steps ifNil: [ ^ self ].
	
	(steps 
		removeAll: (steps 
			select:[ :each | 
				each receiver == aMorph 
				and: [ each selector == aSelector ] ]))
		do: [ :each | each cancel ]
]

{ #category : #'world simulation' }
GtkMorphView >> theme [

	^ Smalltalk ui theme
]

{ #category : #'world simulation' }
GtkMorphView >> transformFrom: aMorph [ 
	
	^ IdentityTransform new
]

{ #category : #'private updating' }
GtkMorphView >> updateAllSurface [

	activeSurface := self newSurfaceOfMorph: self morph.
	layeredMorphs do: [ :each |
		self paintMorph: each ]
]

{ #category : #'private updating' }
GtkMorphView >> updateSurface [
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
GtkMorphView >> updateSurfaceRectangle: aRect in: aMorph [

	aMorph submorphsDo: [ :submorph | | bounds |
		bounds := submorph fullBounds.
		(bounds intersects: aRect) ifTrue: [
			((bounds ~= aRect) and: [ bounds containsRect: aRect ])
				ifTrue: [ self updateSurfaceRectangle: aRect in: submorph ]
				ifFalse: [ self paintMorph: submorph ] ] ]
]

{ #category : #'private updating' }
GtkMorphView >> updateSurfaceRectangles: aCollection [

	self updateSurfaceRectangles: aCollection in: self morph. 
	layeredMorphs do: [ :each | 
		self updateSurfaceRectangles: aCollection in: each ] 
]

{ #category : #'private updating' }
GtkMorphView >> updateSurfaceRectangles: aCollection in: aMorph [

	aCollection do: [ :each |
		self updateSurfaceRectangle: each in: aMorph ]
]

{ #category : #'world simulation' }
GtkMorphView >> viewBox [

	^ self boundingBox
]

{ #category : #'world simulation' }
GtkMorphView >> withAllOwnersDo: aBlock [
	
	aBlock value: self
]

{ #category : #'world simulation' }
GtkMorphView >> world [
	"I'm simulating being a world"

	^ self
]
