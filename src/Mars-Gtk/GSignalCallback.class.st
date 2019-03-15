Class {
	#name : #GSignalCallback,
	#superclass : #GCallback,
	#instVars : [
		'registerId',
		'signalName'
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

{ #category : #connecting }
GSignalCallback >> connectTo: aWidget [

	aWidget connectSignal: self
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

	GtkWidgetSignaledSignal emitSignal: self signalName.
	^ [ block valueWithArguments: args ]
		on: Error
		fork: [ :e | 
			e emit.
			e debug ]
		return: [ 
			self returnOnError ]
]
