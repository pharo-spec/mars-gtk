"
I'm a generic signal to be used on Gtk platform.
"
Class {
	#name : #GtkSignal,
	#superclass : #BeaconSignal,
	#classVars : [
		'FilteredSignals'
	],
	#category : #'Mars-Gtk-Signal'
}

{ #category : #accessing }
GtkSignal class >> filter [
	
	FilteredSignals add: self
]

{ #category : #'class initialization' }
GtkSignal class >> initialize [ 

	FilteredSignals := Set new
]

{ #category : #accessing }
GtkSignal class >> isFiltered [
	
	^ FilteredSignals includes: self
]

{ #category : #accessing }
GtkSignal class >> resume [
	
	FilteredSignals remove: self ifAbsent: [ ]
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
