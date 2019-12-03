Class {
	#name : #GtkSignalTracingFilter,
	#superclass : #GtkSignalFilter,
	#instVars : [
		'tracingSignals'
	],
	#category : #'Mars-Gtk-Signal'
}

{ #category : #'instance creation' }
GtkSignalTracingFilter class >> newTraceSignals: aListOfSignals [

	^ self new 
		tracingSignals: aListOfSignals;
		yourself

]

{ #category : #initialization }
GtkSignalTracingFilter >> initialize [

	super initialize.
	self tracingSignals: OrderedCollection new
]

{ #category : #testing }
GtkSignalTracingFilter >> isFiltered: aSignal [

	^ self isFilteredClass: aSignal class
]

{ #category : #testing }
GtkSignalTracingFilter >> isFilteredClass: aSignalClass [

	^ (tracingSignals includes: aSignalClass) not
]

{ #category : #testing }
GtkSignalTracingFilter >> isTracingFilter [

	^ true
]

{ #category : #accessing }
GtkSignalTracingFilter >> removeTraceFor: aSignalClass [

	tracingSignals 
		remove: aSignalClass 
		ifAbsent: [ ]
]

{ #category : #accessing }
GtkSignalTracingFilter >> trace: aSignalClass [

	tracingSignals add: aSignalClass
]

{ #category : #initialization }
GtkSignalTracingFilter >> tracingSignals: aCollection [

	tracingSignals := aCollection asOrderedCollection
]
