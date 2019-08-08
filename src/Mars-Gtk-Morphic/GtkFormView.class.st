"
I'm a widget to display a world contained in a Form.
Being a Form a bitmap, this component could be used to display any kind of Form, containded in a World (provided through the event handler).
"
Class {
	#name : #GtkFormView,
	#superclass : #GtkMorphicDrawingArea,
	#instVars : [
		'form',
		'surface'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #private }
GtkFormView class >> drawingAreaNew [

	^ self ffiCall: #(GtkFormView *gtk_drawing_area_new ())
]

{ #category : #private }
GtkFormView >> canDraw [

	^ true
]

{ #category : #private }
GtkFormView >> currentExtent [

	^ self form extent
]

{ #category : #drawing }
GtkFormView >> draw: aCr [
	
	surface ifNotNil: [ 
		surface fillInto: aCr ].

	^ false
]

{ #category : #accessing }
GtkFormView >> form [

	^ form
]

{ #category : #accessing }
GtkFormView >> form: aForm [

	form := aForm.
	self sizeRequest: aForm extent.
	self invalidate	
]

{ #category : #'private events' }
GtkFormView >> handleEvent: anEvent [

	anEvent type = GdkEventType GDK_ENTER_NOTIFY 
		ifTrue: [ self grabFocus ].
	^ super handleEvent: anEvent
]

{ #category : #accessing }
GtkFormView >> invalidate [

	self updateSurface.
	self queueDraw
]

{ #category : #accessing }
GtkFormView >> invalidateRect: damageRect [

	self updateSurfaceRectangle: damageRect.
	self queueDrawArea: damageRect
]

{ #category : #private }
GtkFormView >> resizeIfEnabledTo: extent [

	self world worldState worldRenderer checkForNewScreenSize
]

{ #category : #'private updating' }
GtkFormView >> updateSurface [

	surface := GtkCairoSurface fromForm: form
]

{ #category : #'private updating' }
GtkFormView >> updateSurfaceRectangle: aRect [
	| origin newForm |
	
	surface ifNil: [ ^ self updateSurface ].
	
	origin := aRect origin.
	newForm := Form extent: aRect extent depth: 32.
	newForm
		copy: (0 @ 0 extent: aRect extent)
		from: origin
		in: self form
		rule: Form over.
	surface copyForm: newForm clippedBy: aRect at: origin
]

{ #category : #accessing }
GtkFormView >> world [ 

	^ self eventHandler morphicWorld
]
