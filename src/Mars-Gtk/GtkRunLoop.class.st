"
I'm a base run loop for gtk applications.
I define teh base behaviour of a run loop: 

- start/stop 
- event processing

I also can handle deferred actions to be executed when the process allows it. This is specially useful to keep safeness of execution when the execution control is on gtk side (see GtkMainRunLoop)
"
Class {
	#name : #GtkRunLoop,
	#superclass : #Object,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#instVars : [
		'#session',
		'#running',
		'#executing',
		'#inCallback => ProcessLocalSlot'
	],
	#classVars : [
		'#Current'
	],
	#pools : [
		'GtkTypes'
	],
	#classInstVars : [
		'#uniqueInstance'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GtkRunLoop class >> current [
	^ Current ifNil: [ Current := self defaultRunLoopClass uniqueInstance ]
]

{ #category : #accessing }
GtkRunLoop class >> current: aRunLoop [
	Current ifNotNil: [ Current stop ].
	Current := aRunLoop
]

{ #category : #private }
GtkRunLoop class >> defaultRunLoopClass [

	^ GtkPollingRunLoop
]

{ #category : #accessing }
GtkRunLoop class >> defer: aBlock [

	^ self current defer: aBlock
]

{ #category : #accessing }
GtkRunLoop class >> install [

	self = GtkRunLoop ifTrue: [ 
		self error: 'I''m an abstract class. You need to install one of my subclasses.' ].
	^ self current: self uniqueInstance
]

{ #category : #'instance creation' }
GtkRunLoop class >> new [
	^ self error: 'Use #uniqueInstance'
]

{ #category : #accessing }
GtkRunLoop class >> reset [
	self current: nil
]

{ #category : #'instance creation' }
GtkRunLoop class >> uniqueInstance [
	self = GtkRunLoop 
		ifTrue: [ self error: 'I''m an abstract class. Use #uniqueInstance' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #accessing }
GtkRunLoop >> callbackEnter [

	inCallback := true
]

{ #category : #private }
GtkRunLoop >> checkSession [
	^ session == Smalltalk session
]

{ #category : #accessing }
GtkRunLoop >> defer: aBlock [

	^ aBlock value
]

{ #category : #private }
GtkRunLoop >> doNotOverlap: aBlock [
	executing ifTrue: [ ^ self ].
	executing := true.
	aBlock ensure: [ executing := false ]

]

{ #category : #private }
GtkRunLoop >> getEventsPending [

	^ self 
		ffiCall: #( gboolean gtk_events_pending (void) )
]

{ #category : #initialization }
GtkRunLoop >> initialize [
	
	self class initializeSlots: self. 
	super initialize.
	running := false.
	executing := false
]

{ #category : #'private installing' }
GtkRunLoop >> installRunLoop [
	self subclassResponsibility
]

{ #category : #testing }
GtkRunLoop >> isInCallback [

	^ inCallback == true
]

{ #category : #testing }
GtkRunLoop >> isRunning [
	^ running
]

{ #category : #private }
GtkRunLoop >> mainIterationDo: blocking [
	
	^ self 
		ffiCall: #( void gtk_main_iteration_do ( gboolean blocking ) )
]

{ #category : #private }
GtkRunLoop >> processEvents [
	self doNotOverlap: [
		[ (self isRunning and: [ self checkSession ])
			ifTrue: [ self getEventsPending ]
			ifFalse: [ false ] ]
		whileTrue: [ self mainIterationDo: false ] ]
]

{ #category : #running }
GtkRunLoop >> spawnNewRunLoop [

	^ self subclassResponsibility
]

{ #category : #running }
GtkRunLoop >> start [
	self isRunning ifTrue: [ ^ self ].
	
	running := true.
	session := Smalltalk session. 
	self installRunLoop.
]

{ #category : #running }
GtkRunLoop >> stop [ 
	self isRunning ifFalse: [ ^ self ].
	self uninstallRunLoop.	
	running := false

]

{ #category : #'private installing' }
GtkRunLoop >> uninstallRunLoop [
	self subclassResponsibility
]
