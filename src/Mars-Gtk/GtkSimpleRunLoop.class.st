Class {
	#name : #GtkSimpleRunLoop,
	#superclass : #GtkRunLoop,
	#instVars : [
		'inputSemaphore',
		'process'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GtkSimpleRunLoop class >> fps [
	
	^ 60
]

{ #category : #initialization }
GtkSimpleRunLoop >> initialize [
	super initialize.
	inputSemaphore := Semaphore new

]

{ #category : #'private installing' }
GtkSimpleRunLoop >> installRunLoop [

	process := [
		[ self isRunning and: [ session == Smalltalk session ] ] 
		whileTrue: [
			self processEvents ] ]
		forkAt: Processor highIOPriority 
		named: 'GtkRunLoop'
]

{ #category : #'private installing' }
GtkSimpleRunLoop >> processEvents [
	| elapsedTime |
	
	elapsedTime := Time millisecondsToRun: [ 
		[ self getEventsPending ] whileTrue: [ 
			"FrameCounter countEvent."
			self mainIterationDo: false ] ].
	"ensure FPS: 60"
	(Delay forMilliseconds: (((1000 - elapsedTime) / self class fps) asInteger max: 5)) wait 
]

{ #category : #running }
GtkSimpleRunLoop >> spawnNewRunLoop [

	^ self class basicNew initialize 
		start;
		yourself
]

{ #category : #'private installing' }
GtkSimpleRunLoop >> uninstallRunLoop [
	
	process terminate
]
