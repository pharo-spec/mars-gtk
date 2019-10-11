"
A window driver used for running things using Gtk3 library.
"
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

{ #category : #accessing }
OSGtkDriver >> beCurrent [

	Session := Smalltalk session. 
	Current := self
]

{ #category : #'window creation' }
OSGtkDriver >> createWindowWithAttributes: attributes osWindow: osWindow [
	| window |
	
	self ensureGtkRunning.
	
	GtkDefer runInGtk: [	window := OSGtkWindowHandle newAttributes: attributes.
	window osWindow: osWindow.
		
	osWindow setJustCreatedHandle: window.
	
	attributes visible 
		ifTrue: [ window show ]
		ifFalse: [ window hide ]].
	
	^ window
]

{ #category : #'window creation' }
OSGtkDriver >> ensureGtkRunning [
	
	GtkApplication ensureRunning.
	"OSGtkDriverConfiguration new apply"
]

{ #category : #'window creation' }
OSGtkDriver >> unregisterWindowWithId: id [
]
