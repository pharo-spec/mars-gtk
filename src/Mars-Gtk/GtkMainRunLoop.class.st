"
This run loop executes gtk_main. 
For it to work, vm needs to run in a separate thread other than the gtk thread (which is usually the application main thread)
"
Class {
	#name : #GtkMainRunLoop,
	#superclass : #GtkRunLoop,
	#category : #'Mars-Gtk-Base'
}

{ #category : #'private installing' }
GtkMainRunLoop >> gtkMain [
	self ffiCall: #(void gtk_main ())
]

{ #category : #'private installing' }
GtkMainRunLoop >> gtkMainQuit [
	self ffiCall: #(void gtk_main_quit ())
]

{ #category : #'private installing' }
GtkMainRunLoop >> installRunLoop [

	[ self gtkMain ]
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
	
]
