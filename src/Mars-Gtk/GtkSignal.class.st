"
I'm a generic signal to be used on Gtk platform.
"
Class {
	#name : #GtkSignal,
	#superclass : #BeaconSignal,
	#classVars : [
		'ActiveFilter'
	],
	#category : #'Mars-Gtk-Signal'
}

{ #category : #private }
GtkSignal class >> activeFilter [

	^ ActiveFilter ifNil: [ ActiveFilter := GtkSignalFilterAll new ]
]

{ #category : #private }
GtkSignal class >> activeFilter: aFilter [

	ActiveFilter := aFilter
]

{ #category : #'instance creation' }
GtkSignal class >> emit [ 
	
	^ self new emit
]

{ #category : #private }
GtkSignal class >> ensureTracingFilter [

	self activeFilter isTracingFilter 
		ifFalse: [ ActiveFilter := GtkSignalTracingFilter new ].
	^ ActiveFilter
]

{ #category : #'accessing filtering' }
GtkSignal class >> filter [
	
	self ensureTracingFilter trace: self
	 
	
]

{ #category : #'accessing filtering' }
GtkSignal class >> filterAllSignalsExcept: aListOfSignals [

	ActiveFilter := GtkSignalTracingFilter newTraceSignals: aListOfSignals
]

{ #category : #'class initialization' }
GtkSignal class >> initialize [ 

	self resetFilters
]

{ #category : #'accessing filtering' }
GtkSignal class >> isFiltered [
	
	^ self activeFilter isFilteredClass: self
]

{ #category : #private }
GtkSignal class >> resetFilters [

	ActiveFilter := GtkSignalFilterAll new
]

{ #category : #'accessing filtering' }
GtkSignal class >> resume [
	
	self ensureTracingFilter removeTraceFor: self
]

{ #category : #emitting }
GtkSignal >> emit [ 

	self isFiltered ifTrue: [ ^ self ].
	^ super emit
]

{ #category : #testing }
GtkSignal >> isFiltered [

	^ self class activeFilter isFiltered: self
]
