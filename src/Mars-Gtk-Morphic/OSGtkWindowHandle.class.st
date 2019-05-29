Class {
	#name : #OSGtkWindowHandle,
	#superclass : #OSWindowHandle,
	#instVars : [
		'gtkWindow'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #'instance creation' }
OSGtkWindowHandle class >> newWindow: gtkWindow attributes: attributes [

	^ self basicNew 
		initializeWindow: gtkWindow attributes: attributes;
		yourself
]

{ #category : #accessing }
OSGtkWindowHandle >> bounds: newBounds [

	gtkWindow bounds: newBounds
]

{ #category : #accessing }
OSGtkWindowHandle >> extent: newExtent [

	gtkWindow resize: newExtent
]

{ #category : #accessing }
OSGtkWindowHandle >> hide [

	gtkWindow hide
]

{ #category : #initialization }
OSGtkWindowHandle >> initializeWindow: aWindow attributes: attributes [

	self initialize.
	gtkWindow := aWindow.
	attributes applyTo: self	
]

{ #category : #testing }
OSGtkWindowHandle >> isValid [
	
	^ gtkWindow getHandle isNull not
]

{ #category : #accessing }
OSGtkWindowHandle >> position [

	^ gtkWindow position
]

{ #category : #accessing }
OSGtkWindowHandle >> position: newPosition [

	gtkWindow moveTo: newPosition
	
]

{ #category : #accessing }
OSGtkWindowHandle >> show [

	gtkWindow showAll 
]

{ #category : #accessing }
OSGtkWindowHandle >> title [

	^ gtkWindow title
	
]

{ #category : #accessing }
OSGtkWindowHandle >> title: aTitle [

	gtkWindow title: aTitle
]
