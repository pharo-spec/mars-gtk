"
This run loop executes gtk_main. 
For it to work, vm needs to run in a separate thread other than the gtk thread (which is usually the application main thread)
"
Class {
	#name : #GtkMainRunLoop,
	#superclass : #GtkRunLoop,
	#instVars : [
		'deferCallback',
		'process'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GtkMainRunLoop >> defer: aBlock [
	| sem result |

	(self isRunning not or: [ self isInCallback ]) 
		ifTrue: [ ^ aBlock value ].

	sem := Semaphore new.
	GIdle uniqueInstance idleAddFull: (deferCallback ifNil: [ 
		deferCallback := GCallback 
			signature: #(guint (void *data)) 
			block: [ :data | 
				result := aBlock ensure: [ sem signal ]. 
				0 ] ]).
	sem wait.

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

	deferCallback := nil. "Ensure install a new deferCallback"
	process := [ self gtkMain ]
		forkAt: Processor lowIOPriority 
		named: 'GtkRunLoop'
]

{ #category : #running }
GtkMainRunLoop >> spawnNewRunLoop [

	self flag: #TODO. "This is like this for now waiting for a test of using a nested gtk_main"
	^ GtkPollingRunLoop basicNew initialize 
		start;
		yourself
]

{ #category : #'private installing' }
GtkMainRunLoop >> uninstallRunLoop [
	
	GtkDefer runInGtk: [ self gtkMainQuit ].
	
	process ifNil: [ ^ self ].

	process terminate.
	process := nil.
]
