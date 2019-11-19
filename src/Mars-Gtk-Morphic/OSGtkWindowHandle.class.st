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
		'gtkCursorMap',
		'lastKeyboardFocus'
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
	| size |

	self ifWindowIsNotValid: [ ^ 0@0 ].
	size := GtkRunLoop defer: [ gtkWindow size ].
	
	^ size
]

{ #category : #accessing }
OSGtkWindowHandle >> extent: newExtent [

	GtkRunLoop defer: [ gtkWindow resize: newExtent ]
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
		at: Cursor resizeBottom put: (GdkCursor newFromName: 'ns-resize');
		at: Cursor resizeTop put: (GdkCursor newFromName: 'ns-resize');
		at: Cursor resizeBottomLeft put: (GdkCursor newFromName: 'nesw-resize');
		at: Cursor resizeBottomRight put: (GdkCursor newFromName: 'nwse-resize');
		at: Cursor resizeTopLeft put: (GdkCursor newFromName: 'nwse-resize');
		at: Cursor resizeTopRight put: (GdkCursor newFromName: 'nesw-resize');
		at: Cursor resizeLeft put: (GdkCursor newFromName: 'ew-resize');
		at: Cursor blank put: (GdkCursor newFromName: 'none');
		at: Cursor crossHair put: (GdkCursor newFromName: 'crosshair');
		at: Cursor up put: (GdkCursor newFromName: 'n-resize');
		at: Cursor down put: (GdkCursor newFromName: 's-resize');
		at: Cursor menu put: (GdkCursor newFromName: 'context-menu');
		at: Cursor normal put: (GdkCursor newFromName: 'default');
		at: Cursor overEditableText put: (GdkCursor newFromName: 'text');
		at: Cursor wait put: (GdkCursor newFromName: 'wait');
		at: Cursor webLink put: (GdkCursor newFromName: 'pointer');
		at: Cursor write put: (GdkCursor newFromName: 'progress');
		yourself
]

{ #category : #initialization }
OSGtkWindowHandle >> initializeWindowAttributes: attributes [

	gtkWindow := GtkWindow new.
	gtkWindow 
		connectFocusOutEvent: [ self resetKeyboardFocus. false ];
		connectFocusInEvent: [ self restoreKeyboardFocus. false ];
		connectDeleteEvent: [ self quitSession. true ].

	gtkWindow resize: attributes width @ attributes height.
	attributes windowCentered 
		ifTrue: [ gtkWindow center ]
		ifFalse: [ gtkWindow moveTo: attributes x @ attributes y ]
]

{ #category : #testing }
OSGtkWindowHandle >> isValid [
	
	^ gtkWindow getHandle isNull not
]

{ #category : #private }
OSGtkWindowHandle >> newCursorFromForm: cursorForm [
	| newCursor |

	GtkRunLoop defer: [ 
		newCursor := GdkCursor fromForm: cursorForm	].
	^ newCursor
]

{ #category : #factory }
OSGtkWindowHandle >> newFormRenderer: aForm [

	GtkRunLoop defer: [ 
		renderer := OSGtkFormRenderer new
			form: aForm;
			window: self;
			yourself ].
		
	^ renderer
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

{ #category : #private }
OSGtkWindowHandle >> quitSession [

	UIManager default 
		defer: [ WorldState quitSession ]
]

{ #category : #accessing }
OSGtkWindowHandle >> raise [

	GtkRunLoop defer: [ self gtkWindow present ]
]

{ #category : #private }
OSGtkWindowHandle >> resetKeyboardFocus [
		
	ActiveHand ifNil: [ ^ self ].
	lastKeyboardFocus := ActiveHand keyboardFocus.
	ActiveHand keyboardFocus: nil
]

{ #category : #private }
OSGtkWindowHandle >> restoreKeyboardFocus [

	(gtkWindow isNil 
		or: [ lastKeyboardFocus isNil 
		or: [ ActiveHand isNil ] ])
		ifTrue: [ ^ self ].
	
	[ ActiveHand keyboardFocus: lastKeyboardFocus ]
	ensure: [ 
		lastKeyboardFocus := nil ]
]

{ #category : #accessing }
OSGtkWindowHandle >> setMouseCursor: cursorForm mask: maskForm [
	| cursor |
	
	cursor := gtkCursorMap 
		at: cursorForm
		ifAbsentPut: [ self newCursorFromForm: cursorForm ].
	
	GtkRunLoop defer: [
		self gtkWindow cursor: cursor ]
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
