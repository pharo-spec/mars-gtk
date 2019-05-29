Class {
	#name : #OSGtkDriver,
	#superclass : #OSWindowDriver,
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #testing }
OSGtkDriver class >> isSuitable [

	^ self isSupported
]

{ #category : #testing }
OSGtkDriver class >> isSupported [

	^ true
]

{ #category : #'window creation' }
OSGtkDriver >> createWindowWithAttributes: attributes osWindow: osWindow [
	| gtkWindow window |
	
	GtkApplication ensureRunning.
	
	gtkWindow := GtkWindow new.
	gtkWindow title: (attributes title ifNil: [ 'Untitled' ]).
	gtkWindow resize: attributes width @ attributes height.
	attributes windowCentered 
		ifTrue: [ gtkWindow center ]
		ifFalse: [ gtkWindow moveTo: attributes x @ attributes y ].	
	
	attributes visible 
		ifTrue: [ gtkWindow showAll ]
		ifFalse: [ gtkWindow hide ].

	window := OSGtkWindowHandle 
		newWindow: gtkWindow 
		attributes: attributes.
	window osWindow: osWindow.
		
	osWindow setJustCreatedHandle: window.
	
	^ window
]
