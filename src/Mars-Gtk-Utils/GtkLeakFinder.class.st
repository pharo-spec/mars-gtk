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

	(self signals includes: aSignal class) ifFalse: [ ^ self ].
	
	aSignal logIn: self. 
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
