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
	| window |
	
	GtkApplication ensureRunning.
	
	attributes visible 
		ifTrue: [ window show ]
		ifFalse: [ window hide ].

	window := OSGtkWindowHandle newAttributes: attributes.
	window osWindow: osWindow.
		
	osWindow setJustCreatedHandle: window.
	
	^ window
]
