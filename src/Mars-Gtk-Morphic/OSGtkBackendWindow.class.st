"
I'm a window handle for Gtk3.
my handle is a GtkWindow
"
Class {
	#name : #OSGtkBackendWindow,
	#superclass : #OSBackendWindow,
	#instVars : [
		'gtkWindow',
		'world',
		'gtkCursorMap',
		'lastKeyboardFocus'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #'instance creation' }
OSGtkBackendWindow class >> newAttributes: attributes [

	^ self basicNew 
		initializeAttributes: attributes;
		yourself
]

{ #category : #accessing }
OSGtkBackendWindow >> bounds: newBounds [

	gtkWindow bounds: newBounds
]

{ #category : #accessing }
OSGtkBackendWindow >> clipboardText [
	
	^ GtkClipboard forSelection waitForText
]

{ #category : #accessing }
OSGtkBackendWindow >> clipboardText: aString [

	GtkClipboard forSelection text: aString
]

{ #category : #accessing }
OSGtkBackendWindow >> destroy [

	gtkWindow destroy
]

{ #category : #accessing }
OSGtkBackendWindow >> extent [
	| size |

	self ifWindowIsNotValid: [ ^ 0@0 ].
	GtkRunLoop defer: [ size := gtkWindow size ].
	
	^ size
]

{ #category : #accessing }
OSGtkBackendWindow >> extent: newExtent [

	GtkRunLoop defer: [ gtkWindow resize: newExtent ]
]

{ #category : #private }
OSGtkBackendWindow >> gtkWindow [ 
	"to be used by OSGtkFormRenderer to add the form view instance."
	
	^ gtkWindow
]

{ #category : #accessing }
OSGtkBackendWindow >> hide [

	gtkWindow hide
]

{ #category : #private }
OSGtkBackendWindow >> ifWindowIsNotValid: aBlock [

	gtkWindow getHandle isNull ifTrue: aBlock
]

{ #category : #initialization }
OSGtkBackendWindow >> initialize [

	super initialize.
	self initializeCursorMap
]

{ #category : #initialization }
OSGtkBackendWindow >> initializeAttributes: attributes [

	self initialize.
	self initializeWindowAttributes: attributes.
	attributes applyTo: self	
]

{ #category : #initialization }
OSGtkBackendWindow >> initializeCursorMap [
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
OSGtkBackendWindow >> initializeWindowAttributes: attributes [

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
OSGtkBackendWindow >> isValid [
	
	^ gtkWindow getHandle isNull not
]

{ #category : #private }
OSGtkBackendWindow >> newCursorFromForm: cursorForm [
	| newCursor |

	GtkRunLoop defer: [ 
		newCursor := GdkCursor fromForm: cursorForm	].
	^ newCursor
]

{ #category : #factory }
OSGtkBackendWindow >> newFormRenderer: aForm [

	GtkRunLoop defer: [ 
		renderer := OSGtkFormRenderer new
			form: aForm;
			backendWindow: self;
			yourself ].
		
	^ renderer
]

{ #category : #accessing }
OSGtkBackendWindow >> position [

	self ifWindowIsNotValid: [ ^ 0@0 ].
	^ gtkWindow position
]

{ #category : #accessing }
OSGtkBackendWindow >> position: newPosition [

	gtkWindow moveTo: newPosition
	
]

{ #category : #private }
OSGtkBackendWindow >> quitSession [

	UIManager default 
		defer: [ WorldState quitSession ]
]

{ #category : #accessing }
OSGtkBackendWindow >> raise [

	GtkRunLoop defer: [ self gtkWindow present ]
]

{ #category : #private }
OSGtkBackendWindow >> resetKeyboardFocus [
		
	self currentHand ifNil: [ ^ self ].
	lastKeyboardFocus := self currentHand keyboardFocus.
	self currentHand keyboardFocus: nil
]

{ #category : #private }
OSGtkBackendWindow >> restoreKeyboardFocus [

	(gtkWindow isNil 
		or: [ lastKeyboardFocus isNil 
		or: [ self currentHand isNil ] ])
		ifTrue: [ ^ self ].
	
	[ self currentHand keyboardFocus: lastKeyboardFocus ]
	ensure: [ 
		lastKeyboardFocus := nil ]
]

{ #category : #accessing }
OSGtkBackendWindow >> setMouseCursor: cursorForm mask: maskForm [
	| cursor |
	
	cursor := gtkCursorMap 
		at: cursorForm
		ifAbsentPut: [ self newCursorFromForm: cursorForm ].
	
	GtkRunLoop defer: [
		self gtkWindow cursor: cursor ]
]

{ #category : #accessing }
OSGtkBackendWindow >> show [

	gtkWindow showAll
]

{ #category : #accessing }
OSGtkBackendWindow >> title [

	^ gtkWindow title
	
]

{ #category : #accessing }
OSGtkBackendWindow >> title: aTitle [

	gtkWindow title: aTitle
]

{ #category : #accessing }
OSGtkBackendWindow >> world [
	
	^ world
]

{ #category : #accessing }
OSGtkBackendWindow >> world: aWorldMorph [
	
	world := aWorldMorph
]
