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
