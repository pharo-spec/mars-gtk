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
		'linkedCallbacks'
	],
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #evaluating }
GSignalCallback >> basicValueWithArguments: args [
	"
	This method is ugly because it has to solve three scenarios: 
	1) everythign works ok (nor ensure or exception code is executed)
	2) error happens and debugger is proceed (resuming normal execution)
	3) error happens and debugger is closed (making current process to be terminated).
	
	Execute the callback making sure if we have to open a debugger: 
		- the run loop continues working (we spawn a new one for that)
		- we ensure a callback return (in case a debugger is closed without proceeding, the process 
		  will be terminated, we put a return inside the ensure block to force that all calbacks 
		  return)"
	| result finished runLoop |

	GtkWidgetSignaledSignal emitSignal: self signalName.
	finished := false.
	^ [
			[	
				result := block valueWithArguments: args. 
	    		finished := true.
	  	 		result ]
			on: Exception
			do: [ :e |
				runLoop := GtkRunLoop current spawnNewRunLoop.
				e debug ] ]
		ensure: [ 
			runLoop ifNotNil: #stop.
			finished ifFalse: [ 
				^ self returnOnError ] ]
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

	^ self subclassResponsibility
]

{ #category : #evaluating }
GSignalCallback >> valueWithArguments: args [
	"chain linked callbacks, answer last result (ideally, there are just one callback, 
	 but sometimes...)"
	| result |
	
	result := self basicValueWithArguments: args.
	linkedCallbacks ifNotNil: [ 
		linkedCallbacks do: [ :each | 
			result := each basicValueWithArguments: args ] ].
	
	^ result
]
