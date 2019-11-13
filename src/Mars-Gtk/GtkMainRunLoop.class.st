"
This run loop executes gtk_main. 
For it to work, vm needs to run in a separate thread other than the gtk thread (which is usually the application main thread)
"
Class {
	#name : #GtkMainRunLoop,
	#superclass : #GtkRunLoop,
	#instVars : [
		'process'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #accessing }
GtkMainRunLoop >> defer: aBlock [
	| sem result |

	(self isRunning not or: [ self isInCallback ]) ifTrue: [ ^ aBlock value ].

	sem := Semaphore new.
	GIdle uniqueInstance idleAddFull: [ 
		| oldDefer |
		oldDefer := deferring.
		deferring := true.
		result := aBlock ensure: [ 
			deferring := oldDefer. 
			sem signal ] ].
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

	process := [ self gtkMain ]
		forkAt: Processor lowIOPriority 
		named: 'GtkRunLoop'
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
	process terminate.
	process := nil
]
