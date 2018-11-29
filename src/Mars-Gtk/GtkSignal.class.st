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
GtkSignal class >> filterExcept: classesList [
	
	self filter.
	tracingClasses := classesList 
]

{ #category : #'class initialization' }
GtkSignal class >> initialize [ 

	FilteredSignals := Set new
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
