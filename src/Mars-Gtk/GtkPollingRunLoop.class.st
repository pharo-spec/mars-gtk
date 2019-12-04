"
I am a polling run loop.
I run by polling for events, which means I'm not as efficient as I could be, but I work on most situations.
"
Class {
	#name : #GtkPollingRunLoop,
	#superclass : #GtkRunLoop,
	#instVars : [
		'inputSemaphore',
		'process',
		'deferring'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GtkPollingRunLoop class >> fps [
	
	^ 60
]

{ #category : #accessing }
GtkPollingRunLoop >> defer: aBlock [
	| oldDefer |

	oldDefer := deferring.
	deferring := true.
	^ aBlock ensure: [ deferring := oldDefer ]
]

{ #category : #initialization }
GtkPollingRunLoop >> initialize [
	super initialize.
	inputSemaphore := Semaphore new

]

{ #category : #'private installing' }
GtkPollingRunLoop >> installRunLoop [

	process := [
		[ self isRunning and: [ session == Smalltalk session ] ] 
		whileTrue: [
			self processEvents ] ]
		forkAt: Processor highIOPriority 
		named: 'GtkRunLoop'
]

{ #category : #accessing }
GtkPollingRunLoop >> isDeferring [

	^ (deferring == true) or: [ self isInCallback ]
]

{ #category : #'private installing' }
GtkPollingRunLoop >> processEvents [
	| elapsedTime |
	
	elapsedTime := Time millisecondsToRun: [ 
		[ self getEventsPending ] whileTrue: [ 
			"FrameCounter countEvent."
			self mainIterationDo: false ] ].
	"ensure FPS: 60"
	(Delay forMilliseconds: (((1000 - elapsedTime) / self class fps) asInteger max: 5)) wait 
]

{ #category : #running }
GtkPollingRunLoop >> spawnNewRunLoop [

	^ self class basicNew initialize 
		start;
		yourself
]

{ #category : #'private installing' }
GtkPollingRunLoop >> uninstallRunLoop [
	
	process terminate
]
