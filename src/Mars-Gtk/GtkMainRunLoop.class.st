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

	^ self class basicNew initialize 
		start;
		yourself
]

{ #category : #'private installing' }
GtkMainRunLoop >> uninstallRunLoop [
	
]
