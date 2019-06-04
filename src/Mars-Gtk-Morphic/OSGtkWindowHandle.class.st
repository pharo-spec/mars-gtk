Class {
	#name : #OSGtkWindowHandle,
	#superclass : #OSWindowHandle,
	#instVars : [
		'gtkWindow',
		'world'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #'instance creation' }
OSGtkWindowHandle class >> newAttributes: attributes [

	^ self basicNew 
		initializeAttributes: attributes;
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

{ #category : #private }
OSGtkWindowHandle >> gtkWindow [ 
	"to be used by OSGtkFormRenderer to add the form view instance."
	
	^ gtkWindow
]

{ #category : #accessing }
OSGtkWindowHandle >> hide [

	gtkWindow hide
]

{ #category : #initialization }
OSGtkWindowHandle >> initializeAttributes: attributes [

	self initialize.
	self initializeWindowAttributes: attributes.
	attributes applyTo: self	
]

{ #category : #initialization }
OSGtkWindowHandle >> initializeWindowAttributes: attributes [
	
	gtkWindow := GtkWindow new.
	gtkWindow resize: attributes width @ attributes height.
	attributes windowCentered 
		ifTrue: [ gtkWindow center ]
		ifFalse: [ gtkWindow moveTo: attributes x @ attributes y ]
]

{ #category : #testing }
OSGtkWindowHandle >> isValid [
	
	^ gtkWindow getHandle isNull not
]

{ #category : #factory }
OSGtkWindowHandle >> newFormRenderer: aForm [

	^ renderer := OSGtkFormRenderer new
		form: aForm;
		window: self;
		yourself
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

{ #category : #accessing }
OSGtkWindowHandle >> world [
	
	^ world
]

{ #category : #accessing }
OSGtkWindowHandle >> world: aWorldMorph [
	
	world := aWorldMorph
]
