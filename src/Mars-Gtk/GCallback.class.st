Class {
	#name : #GCallback,
	#superclass : #FFICallback,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#instVars : [
		'count'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #evaluating }
GCallback >> basicValueWithArguments: args [
	"This method is using a side effect of ensure (returning from it) in PURPOSE because I need to be 
	 sure an answer is provided and the callback is returned when a debug session is aborted (the 
	 debugger is closed without handling the exception). 
	 So, when debug session terminates this process (See GtkDebugSession>>terminate), ensure blocks 
	 are executed and this one will answer and return a value, allowing Gtk3 to continue working."
	| result finished |

	finished := false.
	^ [ 
		result := block valueWithArguments: args.
		finished := true.
		result ]
	ensure: [ 
		finished ifFalse: [
			^ self returnOnError ] ]
]

{ #category : #evaluating }
GCallback >> valueWithArguments: args [

	GtkRunLoop current callbackEnter.	
	^ self basicValueWithArguments: args
]
