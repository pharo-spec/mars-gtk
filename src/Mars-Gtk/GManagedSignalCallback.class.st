Class {
	#name : #GManagedSignalCallback,
	#superclass : #GCallback,
	#instVars : [
		'registerId'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #'instance creation' }
GManagedSignalCallback class >> do: aBlock [

	^ self new do: aBlock
]

{ #category : #connecting }
GManagedSignalCallback >> connectTo: aWidget [

	aWidget connectSignal: self
]

{ #category : #connecting }
GManagedSignalCallback >> disconnectFrom: aWidget [

	aWidget disconnectCallback: self	
]

{ #category : #accessing }
GManagedSignalCallback >> do: aBlock [

	self 
		signature: self signature 
		block: aBlock
]

{ #category : #printing }
GManagedSignalCallback >> printOn: stream [ 

	super printOn: stream.
	stream << '(' << self signalName << ')'
]

{ #category : #accessing }
GManagedSignalCallback >> registerId [
	^ registerId
]

{ #category : #accessing }
GManagedSignalCallback >> registerId: anObject [
	registerId := anObject
]

{ #category : #accessing }
GManagedSignalCallback >> signalName [

	^ self subclassResponsibility
]

{ #category : #accessing }
GManagedSignalCallback >> signature [

	^ #(void (void *widget, void *data))
]

{ #category : #evaluating }
GManagedSignalCallback >> valueWithArguments: args [
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
