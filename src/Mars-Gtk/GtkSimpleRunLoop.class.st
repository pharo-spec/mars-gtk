Class {
	#name : #GtkSimpleRunLoop,
	#superclass : #GtkRunLoop,
	#instVars : [
		'inputSemaphore',
		'process'
	],
	#category : #'Mars-Gtk-Base'
}

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
		forkAt: Processor lowIOPriority 
		named: 'GtkRunLoop'
]

{ #category : #'private installing' }
GtkSimpleRunLoop >> processEvents [

	[ self getEventsPending ]
		whileTrue: [ self mainIterationDo: false ].
	(Delay forMilliseconds: 5) wait 
]

{ #category : #'private installing' }
GtkSimpleRunLoop >> uninstallRunLoop [
	
	process terminate
]
