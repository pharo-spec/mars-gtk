Class {
	#name : #GtkApplication,
	#superclass : #Object,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#instVars : [
		'runLoop',
		'windowRegistry',
		'resourceManager'
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

{ #category : #private }
GtkApplication class >> reset [
	<script>

	Current ifNil: [ ^ self ].
	Current stop.
	Current := nil.
	self flag: #TODO. "I'm placing this here, not sure is the right place but for now it works"
	GtkDestroySignal reset.
]

{ #category : #'system startup' }
GtkApplication class >> shutDown: quitting [
	"ensure Gtk3 is stop when shutting down"

	Current ifNil: [ ^ self ].
	Current shutDown: quitting.

]

{ #category : #'system startup' }
GtkApplication class >> startUp: resuming [
	
	resuming ifTrue: [ 
		Current := nil.
		self flag: #TODO. "I'm placing this here, not sure is the right place but for now it works"
		GtkDestroySignal reset ].
	
	Current ifNil: [ ^ self ].
	Current startUp: resuming
]

{ #category : #private }
GtkApplication >> initArgC: argc argV: argv [

	^ self ffiCall: #(void gtk_init ("int *"void *argc, "char ***"void *argv))
]

{ #category : #private }
GtkApplication >> initGtk3 [
	"Initialize Gtk3"

	self 
		initArgC: ExternalAddress null 
		argV: ExternalAddress null
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

	windowRegistry add: aWindow.
	GtkWindowRegisterSignal emitWidget: aWindow	
]

{ #category : #accessing }
GtkApplication >> resourceManager [

	^ GtkExternalResourceManager uniqueInstance
]

{ #category : #running }
GtkApplication >> run [
	Current ifNotNil: [ Current stop ].
	Current := nil.
	self start.
	Current := self.
	
]

{ #category : #'system startup' }
GtkApplication >> shutDown: quitting [
	
	Stdio stdout << 'DOWN LOOP'; crlf.

	self isRunning ifFalse: [ ^ self ].
	runLoop stop
]

{ #category : #'private running' }
GtkApplication >> start [ 
	self isRunning ifTrue: [ self stop ].

	self initGtk3.
	GtkApplicationStartSignal emit.
	runLoop start
]

{ #category : #'system startup' }
GtkApplication >> startUp: resuming [

"	resuming ifTrue: [  
		self initGtk3.
		GtkDestroySignal reset.
		GtkApplicationStartSignal emit ].
"
	resuming ifFalse: [ 
		 runLoop start ]
]

{ #category : #'private running' }
GtkApplication >> stop [
	self isRunning ifFalse: [ ^ self ].
	runLoop stop
]

{ #category : #running }
GtkApplication >> suspendRunLoopWhile: aBlock [
	self stop.
	^ aBlock ensure: [ self start ]
]

{ #category : #registry }
GtkApplication >> unregisterWindow: aWindow [

	GtkWindowUnregisterSignal emitWidget: aWindow.
	windowRegistry 
		remove: aWindow 
		ifAbsent: [ ]
]

{ #category : #accessing }
GtkApplication >> windowByHandle: aHandle [ 
	| numberHandle |

	numberHandle := aHandle asInteger.
	^ windowRegistry 
		detect: [ :each | each getHandle asInteger = numberHandle ] 
		ifNone: [ nil ]
]
