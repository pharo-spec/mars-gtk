Class {
	#name : #GtkDebugSession,
	#superclass : #DebugSession,
	#instVars : [
		'runLoop',
		'oldUIProcess',
		'newUIProcess',
		'resumed'
	],
	#category : #'Mars-Gtk-Morphic-UIManager'
}

{ #category : #private }
GtkDebugSession >> initialize [

	resumed := false.
	super initialize.
]

{ #category : #private }
GtkDebugSession >> isInCallback [

	^ runLoop notNil
]

{ #category : #accessing }
GtkDebugSession >> newUIProcess [

	^ newUIProcess
]

{ #category : #accessing }
GtkDebugSession >> newUIProcess: aProcess [

	newUIProcess := aProcess
]

{ #category : #accessing }
GtkDebugSession >> oldUIProcess [

	^ oldUIProcess
]

{ #category : #accessing }
GtkDebugSession >> oldUIProcess: aProcess [

	oldUIProcess := aProcess
]

{ #category : #'debugging actions' }
GtkDebugSession >> resume [

	self stopRunLoop.
	^ super resume
]

{ #category : #'debugging actions' }
GtkDebugSession >> resume: aValue [

	self stopRunLoop.
	^ super resume: aValue
]

{ #category : #private }
GtkDebugSession >> resumeProcess [
	"Make sure the interrupted process is restored properly and restart the low space handler"
	
	resumed := true.
	
	interruptedProcess isTerminated
		ifFalse: [ 
			self isInCallback
				ifTrue: [ 
					self newUIProcess ifNotNil: [ 
						(self oldUIProcess == self newUIProcess) ifFalse: [ 
							'TRUE' crTrace.
							UIManager default resumeUIProcess: self oldUIProcess ] ].
					interruptedProcess resume ]
				ifFalse: [ 
					errorWasInUIProcess
						ifTrue: [ UIManager default resumeUIProcess: interruptedProcess  ]
						ifFalse: [ interruptedProcess resume ] ] ].
	
	"restart low space handler"
	Smalltalk installLowSpaceWatcher
]

{ #category : #private }
GtkDebugSession >> runLoop [

	^ runLoop
]

{ #category : #private }
GtkDebugSession >> runLoop: aRunLoop [

	runLoop := aRunLoop
]

{ #category : #accessing }
GtkDebugSession >> spanNewSession [

	^ super spanNewSession
		runLoop: self runLoop;
		newUIProcess: self newUIProcess;
		oldUIProcess: self oldUIProcess;
		yourself
]

{ #category : #running }
GtkDebugSession >> spawnNewRunLoop [

	runLoop := GtkRunLoop current spawnNewRunLoop
]

{ #category : #keepAlive }
GtkDebugSession >> stopKeepingAlive: anObjectThatNoLongerWantsToKeepMeAlive [
	
	self objectsThatWantToKeepMeAlive
		remove: anObjectThatNoLongerWantsToKeepMeAlive
		ifAbsent: [ "It's a weak collection, its elements can be nilled by the garbage collector at any time if they are not referenced elsewhere, so it can happen not to find the object to remove because it has already been nilled"
			 ].

	self stopRunLoop.
	self stopUIProcess.
	self terminate

]

{ #category : #private }
GtkDebugSession >> stopRunLoop [

	runLoop ifNil: [ ^ self ].
	runLoop stop.
	runLoop := nil
]

{ #category : #private }
GtkDebugSession >> stopUIProcess [
	"ensure UIProcess die"
	
	self flag: #TODO. "This is probably due a leak, since unreferencing an old ui loop should 
	clean it, but they are remaining, so for now I force it."
	
	"errorWasInUIProcess ifFalse: [ ^ self ].
	(self newUIProcess isNil and: [ self oldUIProcess isNil ]) ifTrue: [ ^ self ].

	resumed 
		ifTrue: [
			self newUIProcess ifNotNil: [ :process | 
				process isTerminated 	ifFalse: [ process terminate ] ] ]
		ifFalse: [
			self oldUIProcess ifNotNil: [ :process | 
				process isTerminated 	ifFalse: [ process terminate ] ] ]"
]

{ #category : #'debugging actions' }
GtkDebugSession >> terminate [

	self stopRunLoop.
	super terminate.

]
