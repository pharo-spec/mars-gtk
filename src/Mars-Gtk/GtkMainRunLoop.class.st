Class {
	#name : #GtkMainRunLoop,
	#superclass : #GtkRunLoop,
	#instVars : [
		'process'
	],
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

{ #category : #'private installing' }
GtkMainRunLoop >> uninstallRunLoop [
	
	GtkDefer runInGtk: [ self gtkMainQuit ].
	
	process ifNil: [ ^ self ].

	process terminate.
	process := nil.
]
