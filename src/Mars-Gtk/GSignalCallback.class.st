Class {
	#name : #GSignalCallback,
	#superclass : #GCallback,
	#instVars : [
		'signal',
		'registerId'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #'instance creation' }
GSignalCallback class >> signal: aString signature: aSignature block: aBlock [

	^ (self 
		signature: aSignature 
		block: aBlock)
		signal: aString;
		yourself
]

{ #category : #printing }
GSignalCallback >> printOn: stream [ 

	super printOn: stream.
	stream << '(' << self signal << ')'
]

{ #category : #accessing }
GSignalCallback >> registerId [
	^ registerId
]

{ #category : #accessing }
GSignalCallback >> registerId: anObject [
	registerId := anObject
]

{ #category : #accessing }
GSignalCallback >> signal [
	^ signal
]

{ #category : #accessing }
GSignalCallback >> signal: anObject [
	signal := anObject
]

{ #category : #evaluating }
GSignalCallback >> valueWithArguments: args [
	"same as my parent, but with logging"

	GtkWidgetSignaledSignal emitSignal: self signal.
	^ [ block valueWithArguments: args ]
		on: Error
		fork: [ :e | 
			e emit.
			e debug ]
		return: [ 
			self returnOnError ]
]
