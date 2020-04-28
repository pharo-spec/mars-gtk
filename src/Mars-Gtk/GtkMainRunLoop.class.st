"
This run loop executes gtk_main. 
For it to work, vm needs to run in a separate thread other than the gtk thread (which is usually the application main thread)
"
Class {
	#name : #GtkMainRunLoop,
	#superclass : #GtkRunLoop,
	#instVars : [
		'process',
		'callerProcess'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GtkMainRunLoop >> callerProcess [

	^ callerProcess
]

{ #category : #accessing }
GtkMainRunLoop >> defer: aBlock [
	| sem result |

	(self isRunning not 
		or: [ self isInCallback ]) 
		ifTrue: [ ^ aBlock value ].

	callerProcess := Processor activeProcess.
	sem := Semaphore new.
	GIdle uniqueInstance idleAddFull: [ 
		result := aBlock ensure: [ sem signal ] ].
	sem wait.
	callerProcess := nil.

	^ result
]

{ #category : #'private primitives' }
GtkMainRunLoop >> gtkMain [

	self ffiCall: #(void gtk_main ())
]

{ #category : #'private primitives' }
GtkMainRunLoop >> gtkMainQuit [

	self ffiCall: #(void gtk_main_quit ())
]

{ #category : #'private installing' }
GtkMainRunLoop >> installRunLoop [

	process := [ self gtkMain ]
		forkAt: Processor lowIOPriority 
		named: 'GtkRunLoop'
]

{ #category : #accessing }
GtkMainRunLoop >> isDeferring [

	^ self isInCallback
]

{ #category : #accessing }
GtkMainRunLoop >> naturalRunner [
	"Answer the 'natural' FFI client to run Gtk.
	 When using this run loop, gtk_main needs to be running in the main thread which means
	 the VM is running in secondary thread. This means ultimately that every Gtk call needs 
	 to be send to the main thread."

	^ TFMainThreadRunner uniqueInstance
]

{ #category : #running }
GtkMainRunLoop >> spawnNewRunLoop [

	^ self class basicNew initialize 
		start;
		yourself
]

{ #category : #'private installing' }
GtkMainRunLoop >> uninstallRunLoop [
	
	self defer: [ self gtkMainQuit ].
	
	process ifNil: [ ^ self ].
	"No need to do this since quitting gtk main will cause the process to end"
	"process terminate."
	process := nil
]
