"
I'm a window handle for Gtk3.
my handle is a GtkWindow
"
Class {
	#name : #OSGtkWindowHandle,
	#superclass : #OSWindowHandle,
	#instVars : [
		'gtkWindow',
		'world',
		'gtkCursorMap'
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
OSGtkWindowHandle >> clipboardText [
	
	^ GtkClipboard forSelection waitForText
]

{ #category : #accessing }
OSGtkWindowHandle >> clipboardText: aString [

	GtkClipboard forSelection text: aString
]

{ #category : #accessing }
OSGtkWindowHandle >> destroy [

	gtkWindow destroy
]

{ #category : #accessing }
OSGtkWindowHandle >> extent [

	self ifWindowIsNotValid: [ ^ 0@0 ].
	^ gtkWindow size
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

{ #category : #private }
OSGtkWindowHandle >> ifWindowIsNotValid: aBlock [

	gtkWindow getHandle isNull ifTrue: aBlock
]

{ #category : #initialization }
OSGtkWindowHandle >> initialize [

	super initialize.
	self initializeCursorMap
]

{ #category : #initialization }
OSGtkWindowHandle >> initializeAttributes: attributes [

	self initialize.
	self initializeWindowAttributes: attributes.
	attributes applyTo: self	
]

{ #category : #initialization }
OSGtkWindowHandle >> initializeCursorMap [
	"this is a map of cursors from morphic to existing gtk cursors. 
	 they will be used to not always use the morphic ones, which is not what we want (unless 
	 specified)"
	
	gtkCursorMap := Dictionary new
		at: Cursor resizeBottom put: 'ns-resize';
		at: Cursor resizeTop put: 'ns-resize';
		at: Cursor resizeBottomLeft put: 'nesw-resize';
		at: Cursor resizeBottomRight put: 'nwse-resize';
		at: Cursor resizeTopLeft put: 'nwse-resize';
		at: Cursor resizeTopRight put: 'nesw-resize';
		at: Cursor resizeLeft put: 'ew-resize';
		at: Cursor blank put: 'none';
		at: Cursor crossHair put: 'crosshair';
		at: Cursor up put: 'n-resize';
		at: Cursor down put: 's-resize';
		at: Cursor menu put: 'context-menu';
		at: Cursor normal put: 'default';
		at: Cursor overEditableText put: 'text';
		at: Cursor wait put: 'wait';
		at: Cursor webLink put: 'pointer';
		at: Cursor write put: 'progress';
		yourself
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

	self ifWindowIsNotValid: [ ^ 0@0 ].
	^ gtkWindow position
]

{ #category : #accessing }
OSGtkWindowHandle >> position: newPosition [

	gtkWindow moveTo: newPosition
	
]

{ #category : #accessing }
OSGtkWindowHandle >> raise [

	self gtkWindow present
]

{ #category : #accessing }
OSGtkWindowHandle >> setMouseCursor: cursorForm mask: maskForm [
	| cursor |
	
	cursor := gtkCursorMap 
		at: cursorForm
		ifPresent: [ :cursorName | GdkCursor newFromName: cursorName ]
		ifAbsent: [ GdkCursor fromForm: cursorForm ].
	
	self gtkWindow cursor: cursor
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
