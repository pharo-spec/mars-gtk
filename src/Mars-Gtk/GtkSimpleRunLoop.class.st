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

	self mainIterationDo: true.

]

{ #category : #'private installing' }
GtkSimpleRunLoop >> uninstallRunLoop [
	
	process terminate
]
