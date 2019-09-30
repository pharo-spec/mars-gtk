"
I'm a generic signal to be used on Gtk platform.
"
Class {
	#name : #GtkSignal,
	#superclass : #BeaconSignal,
	#classVars : [
		'FilteredSignals'
	],
	#classInstVars : [
		'tracingClasses'
	],
	#category : #'Mars-Gtk-Signal'
}

{ #category : #'instance creation' }
GtkSignal class >> emit [ 
	
	^ self new emit
]

{ #category : #accessing }
GtkSignal class >> filter [
	
	FilteredSignals add: self
]

{ #category : #accessing }
GtkSignal class >> filterAllSignalsExcept: aListOfSignals [

	self resetFilters.
	self allSubclasses 
		reject: [ :each | aListOfSignals includes: each ]
		thenDo: [ :each | each filter ]
]

{ #category : #'class initialization' }
GtkSignal class >> initialize [ 

	self resetFilters
]

{ #category : #accessing }
GtkSignal class >> isFiltered [
	
	^ FilteredSignals includes: self
]

{ #category : #testing }
GtkSignal class >> isTracing: aWidget [

	^ self tracingClasses includes: aWidget class
]

{ #category : #private }
GtkSignal class >> resetFilters [

	FilteredSignals := Set new	
]

{ #category : #private }
GtkSignal class >> resetTrace [

	tracingClasses := nil
]

{ #category : #accessing }
GtkSignal class >> resume [
	
	FilteredSignals remove: self ifAbsent: [ ].
	self resetTrace
]

{ #category : #private }
GtkSignal class >> tracingClasses [

	^ tracingClasses ifNil: [ #() ]
]

{ #category : #emitting }
GtkSignal >> emit [ 

	self isFiltered ifTrue: [ ^ self ].
	^ super emit
]

{ #category : #testing }
GtkSignal >> isFiltered [

	^ self class isFiltered
]

{ #category : #testing }
GtkSignal >> isTracing: anObject [ 

	^ self class isTracing: anObject
]
