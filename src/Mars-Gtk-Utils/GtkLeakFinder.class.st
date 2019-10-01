Class {
	#name : #GtkLeakFinder,
	#superclass : #SignalLogger,
	#instVars : [
		'created',
		'destroyed',
		'mutex'
	],
	#category : #'Mars-Gtk-Utils'
}

{ #category : #registering }
GtkLeakFinder >> ensureLoggingSignals [
	
	self signals do: #resume
]

{ #category : #initialize }
GtkLeakFinder >> initialize [

	super initialize.
	mutex := Mutex new.
	created := Set new.
	destroyed := Set new
]

{ #category : #'as yet unclassified' }
GtkLeakFinder >> leaks [

	3 timesRepeat: [ Smalltalk garbageCollect ].
	^ created select: [ :each | (destroyed includes: each handle) not ]
]

{ #category : #'as yet unclassified' }
GtkLeakFinder >> leaksWithReferenceCount [

	^ (self leaks collect: [ :each | each -> (each referenceCount) ]) asDictionary
]

{ #category : #'as yet unclassified' }
GtkLeakFinder >> logCreateSignal: aSignal [

	mutex critical: [ 
		created add: (GtkWidgetTrace new 
			widgetClass: aSignal widget class;
			handle: aSignal widget getHandle copy;
			yourself) ]
]

{ #category : #'as yet unclassified' }
GtkLeakFinder >> logDestroySignal: aSignal [

	mutex critical: [ 
		destroyed add: aSignal handle copy ]
]

{ #category : #registering }
GtkLeakFinder >> nextPut: aSignal [

	aSignal logIn: self
]

{ #category : #registering }
GtkLeakFinder >> signals [

	^ { GtkCreateSignal. GtkDestroySignal }
]

{ #category : #registering }
GtkLeakFinder >> start [

	self ensureLoggingSignals.
	super start
]
