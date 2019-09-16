"
I'm a callback that will be used to connect to Gtk3 signals.
Signals are how gtk sends events to its components.

Gtk3 allows just one function to be connected to a signal, which is usually ok in a C program, but in certain cases we want to link several callbacks to same signal, for example if you want to do several things when a buffer changes (highlighting, processing auto accept of text, etc.), or you want to do different things when a widget is destroyed (logging, cleaning, etc.).
For those cases, I can #link: me with another callback. 
In practice, I will chain all callbacks executions. 
INPORTANT: In case of those callbacks that returns a value, the resulting value will be the last chained execution.
"
Class {
	#name : #GSignalCallback,
	#superclass : #GCallback,
	#instVars : [
		'registerId',
		'signalName',
		'linkedCallbacks'
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
		signalName: aString;
		yourself
]

{ #category : #evaluating }
GSignalCallback >> basicValueWithArguments: args [
	"same as my parent, but with logging"

	GtkWidgetSignaledSignal emitSignal: self signalName.
	^ [ block valueWithArguments: args ]
		on: Error
		fork: [ :e | 
			e emit.
			e debug ]
		return: [ 
			self returnOnError ]
]

{ #category : #connecting }
GSignalCallback >> connectTo: aWidget [

	aWidget connectSignal: self
]

{ #category : #testing }
GSignalCallback >> hasLinkedCallbacks [

	^ linkedCallbacks notNil
]

{ #category : #accessing }
GSignalCallback >> link: aCallback [

	linkedCallbacks := linkedCallbacks
		ifNotNil: [ linkedCallbacks copyWith: aCallback ] 
		ifNil: [ { aCallback } ]
]

{ #category : #printing }
GSignalCallback >> printOn: stream [ 

	super printOn: stream.
	stream << '(' << self signalName << ')'
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
GSignalCallback >> signalName [

	^ signalName
]

{ #category : #accessing }
GSignalCallback >> signalName: aString [

	signalName := aString
]

{ #category : #evaluating }
GSignalCallback >> valueWithArguments: args [
	"same as my parent, but with logging"
	| result |
	
	result := self basicValueWithArguments: args.
	linkedCallbacks ifNotNil: [ 
		linkedCallbacks do: [ :each | 
			result := each basicValueWithArguments: args ] ].
	
	^ result
]
