"
I'm a widget to display morphs. 
"
Class {
	#name : #GtkMorphView,
	#superclass : #GtkMorphicDrawingArea,
	#instVars : [
		'morph',
		'activeSurface',
		'drawQueued',
		'damageRecorder',
		'morphResizable',
		'activeHand',
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
		title: 'PlugabbleButtonMorph Event Example';
		resize: 500@500;
		add: (GtkBox newVertical
			packStart: inform expand: false fill: false padding: 0;
			packStart: (GtkMorphView newMorph: morph);
			yourself);
		showAll
]

{ #category : #examples }
GtkMorphView class >> example7 [
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
GtkMorphView class >> example8 [
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

{ #category : #accessing }
GtkMorphView class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_morph_view_get_type())
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
GtkMorphView >> activateCursor: aCursor withMask: aForm [ 
	
	self flag: #TODO.
]

{ #category : #'world simulation' }
GtkMorphView >> activeHand [
	
	^ activeHand ifNil: [ 
		activeHand := HandMorph new 
			privateOwner: self;
			yourself ]
]

{ #category : #private }
GtkMorphView >> activeSurface [
	
	^ activeSurface
]

{ #category : #private }
GtkMorphView >> activeSurface: aSurface [

	activeSurface := aSurface
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

{ #category : #private }
GtkMorphView >> canDraw [

	^ self morph notNil
]

{ #category : #initialization }
GtkMorphView >> createEventHandler [

	^ GtkMorphicEventHandler for: self world
]

{ #category : #'world simulation' }
GtkMorphView >> currentCursor [
	
	self flag: #TODO. "cursor handling"
	^ Cursor normal
]

{ #category : #'world simulation' }
GtkMorphView >> currentCursor: aCursor [

	self flag: #TODO.
]

{ #category : #private }
GtkMorphView >> currentExtent [

	^ self morph extent
]

{ #category : #'world simulation' }
GtkMorphView >> defer: aBlock [

	aBlock value
]

{ #category : #drawing }
GtkMorphView >> draw: cr [

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

{ #category : #'private events' }
GtkMorphView >> handleEvent: event [

	self morph ifNil: [ ^ false ].
	^ super handleEvent: event

	
]

{ #category : #initialization }
GtkMorphView >> initialize [ 

	super initialize.
	self beMorphResizable.

	drawQueued := false.
	drawing := false.
	damageRecorder := DamageRecorder new.	
	layeredMorphs := OrderedCollection new: 1.
	eventHandler := self createEventHandler	
]

{ #category : #'private updating' }
GtkMorphView >> intersectingMorphs: aMorph within: aRect [
	| morphs |
	
	aMorph fullBounds = aRect
		ifTrue: [ ^ { aMorph } ].
	
	morphs := OrderedCollection new.
	aMorph submorphsDo: [ :submorph | | bounds |
		bounds := submorph fullBounds.
		(bounds intersects: aRect) ifTrue: [
			((bounds ~= aRect) and: [ bounds containsRect: aRect ])
				ifTrue: [ morphs addAll: (self intersectingMorphs: submorph within: aRect) ]
				ifFalse: [ morphs add: submorph ] ] ].
		
	aRect
		allAreasOutsideList: (morphs collect: [ :each | each fullBounds ])
		do: [ :eachArea | ^ { aMorph } ].

	^ morphs reversed
]

{ #category : #'private updating' }
GtkMorphView >> intersectingMorphsWithin: aRect [
	| allMorphs intersectingMorphs |
	
	intersectingMorphs := OrderedCollection new.
	allMorphs := layeredMorphs copyWithFirst: self morph.
	allMorphs do: [ :eachMorph |
		eachMorph fullBounds = aRect ifTrue: [ ^ { eachMorph } ].
	
		intersectingMorphs := OrderedCollection new.
		eachMorph submorphsDo: [ :submorph | | bounds |
			bounds := submorph fullBounds.
			(bounds intersects: aRect) ifTrue: [
				((bounds ~= aRect) and: [ bounds containsRect: aRect ])
					ifTrue: [ intersectingMorphs addAll: (self intersectingMorphs: submorph within: aRect) ]
					ifFalse: [ intersectingMorphs add: submorph ] ] ] ].
	
	aRect
		allAreasOutsideList: (intersectingMorphs collect: [ :each | each fullBounds ])
		do: [ :eachArea | ^ { self morph } ].
		
	^ intersectingMorphs	reversed
]

{ #category : #'world simulation' }
GtkMorphView >> invalidRect: damageRect from: aMorph [

	self invalidateRect: damageRect
]

{ #category : #accessing }
GtkMorphView >> invalidate [

	self invalidate: true
]

{ #category : #private }
GtkMorphView >> invalidate: needQueue [

	damageRecorder doFullRepaint.
	needQueue ifTrue: [ self queueDraw ]
]

{ #category : #accessing }
GtkMorphView >> invalidateRect: damageRect [

	damageRecorder recordInvalidRect: damageRect.
	self queueDrawArea: damageRect
]

{ #category : #'world simulation' }
GtkMorphView >> isCursorOwner [

	^ true
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
		self stopStepping.
		"if we are replacing a morph, we will need to transmit to the new morph some properties. 
		 Also, we will need to force a queue"
		(self isMorphResizable and: [ aMorph extent < morph extent ]) ifTrue: [ 
			aMorph extent: morph extent ].
		needQueue := true ].
	
	morph := aMorph.
	"I will be the owner (and I will act as a world)"
	morph privateOwner: self.
	"in this view, position of the morph is always 0@0"
	morph position: 0@0.
	"check for the need of steppiong stepping"
	morph wantsSteps ifTrue: [ self startStepping: morph ].
	
	self sizeRequest: aMorph extent.
	self invalidate: needQueue
]

{ #category : #private }
GtkMorphView >> morphResizable: aBoolean [

	morphResizable := aBoolean
]

{ #category : #testing }
GtkMorphView >> needUpdate [

	^ damageRecorder updateIsNeeded
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

{ #category : #'private updating' }
GtkMorphView >> paintMorph: aMorph [
	| cr position morphSurface |
	
	position := aMorph position.
	morphSurface := self newSurfaceOfMorph: aMorph.
	cr := self cairoCreate: self activeSurface getHandle.
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
GtkMorphView >> privateRemove: aMorph [
	
	^ aMorph
]

{ #category : #'world simulation' }
GtkMorphView >> processEvent: anEvent [
 
	^ self morph processEvent: anEvent
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

{ #category : #'world simulation' }
GtkMorphView >> removedMorph: aMorph [
]

{ #category : #private }
GtkMorphView >> resizeIfEnabledTo: extent [

	self isMorphResizable ifFalse: [ ^ self ].
	self morph ifNil: [ ^ self ].
	self morph extent: extent
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
	
	newStep schedule.
	
	self connectDestroy: [ 
		self stopStepping ]
]

{ #category : #'world simulation' }
GtkMorphView >> stopStepping [
	
	steps ifNil: [ ^ self ].
	
	steps do: [ :each | each cancel ].
	steps := nil
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

	self activeSurface: (self newSurfaceOfMorph: self morph).
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
GtkMorphView >> updateSurfaceRectangles: aCollection [
	| rect | 

	rect := aCollection size = 1
		ifTrue: [ aCollection anyOne ]
		ifFalse: [ Rectangle merging: aCollection ].

	(self intersectingMorphsWithin: rect) do: [ :eachMorph |
		eachMorph = self morph ifTrue: [ ^ self updateAllSurface ].
		self paintMorph: eachMorph ] 
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
