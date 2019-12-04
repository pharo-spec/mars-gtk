Class {
	#name : #GCallback,
	#superclass : #FFICallback,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #evaluating }
GCallback >> basicValueWithArguments: args [
	"This method is ugly because it has to solve three scenarios: 
	1) everythign works ok (nor ensure or exception code is executed)
	2) error happens and debugger is proceed (resuming normal execution)
	3) error happens and debugger is closed (making current process to be terminated).
	
	Execute the callback making sure if we have to open a debugger: 
		- the run loop continues working (we spawn a new one for that)
		- we ensure a callback return (in case a debugger is closed without proceeding, the process 
		  will be terminated, we put a return inside the ensure block to force that all calbacks 
		  return)"
	| result finished runLoop |

	finished := false.
	^ [
			[	
				result := block valueWithArguments: args. 
	    		finished := true.
	  	 		result ]
			on: Exception
			do: [ :e |
				runLoop := GtkRunLoop current spawnNewRunLoop.
				e defaultAction ] ]
		ensure: [ 
			runLoop ifNotNil: #stop.
			finished ifFalse: [ 
				^ self returnOnError ] ]
]

{ #category : #evaluating }
GCallback >> valueWithArguments: args [

	GtkRunLoop current callbackEnter.	
	^ self basicValueWithArguments: args
]
