Class {
	#name : #GtkApplication,
	#superclass : #Object,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#instVars : [
		'runLoop',
		'windowRegistry'
	],
	#classVars : [
		'Current'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GtkApplication class >> current [
	^ Current
]

{ #category : #accessing }
GtkApplication class >> ensureRunning [ 

	self isRunning ifTrue: [ ^ self ]. 
	self new run
]

{ #category : #'class initialization' }
GtkApplication class >> initialize [
	SessionManager default registerSystemClassNamed: self name
]

{ #category : #testing }
GtkApplication class >> isRunning [ 
	
	^ self current notNil 
		and: [ self current isRunning ]
]

{ #category : #'system startup' }
GtkApplication class >> shutDown: quitting [
	"ensure Gtk is stop when shutting down"
	quitting ifFalse: [ ^ self ].
	Current ifNil: [ ^ self ].
	Current stop.
]

{ #category : #private }
GtkApplication >> initArgC: argc argV: argv [
	^ self ffiCall: #( void gtk_init ( ulong argc, ulong argv ) )
]

{ #category : #private }
GtkApplication >> initGtk3 [
	"Initialize Gtk3"

	self initArgC: 0 argV: 0
]

{ #category : #initialization }
GtkApplication >> initialize [
	super initialize.
	windowRegistry := Set new.
	runLoop := GtkRunLoop current
]

{ #category : #testing }
GtkApplication >> isRunning [ 
	^ runLoop isRunning
]

{ #category : #registry }
GtkApplication >> registerWindow: aWindow [

	windowRegistry add: aWindow
]

{ #category : #running }
GtkApplication >> run [
	Current ifNotNil: [ Current stop ].
	Current := nil.
	self start.
	Current := self.
	
]

{ #category : #'private running' }
GtkApplication >> start [ 
	self isRunning ifTrue: [ self stop ].
	self initGtk3.
	"runLoop start"
]

{ #category : #'private running' }
GtkApplication >> stop [
	self isRunning ifFalse: [ ^ self ].
	runLoop stop
]

{ #category : #'as yet unclassified' }
GtkApplication >> suspendRunLoopWhile: aBlock [
	self stop.
	^ aBlock ensure: [ self start ]
]

{ #category : #registry }
GtkApplication >> unregisterWindow: aWindow [

	windowRegistry 
		remove: aWindow 
		ifAbsent: [ ]
]
