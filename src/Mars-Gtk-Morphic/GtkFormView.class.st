"
I'm a widget to display a world contained in a Form.
Being a Form a bitmap, this component could be used to display any kind of Form, containded in a World (provided through the event handler).
"
Class {
	#name : #GtkFormView,
	#superclass : #GtkMorphicDrawingArea,
	#instVars : [
		'form'
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

{ #category : #private }
GtkFormView >> resizeIfEnabledTo: extent [

	self world checkNewWindowSize
]

{ #category : #'private updating' }
GtkFormView >> updateAllSurface [
		
	self activeSurface: (AthensCairoSurface fromForm: (self form asFormOfDepth: 32))
]

{ #category : #'private updating' }
GtkFormView >> updateSurfaceRectangle: aRect [
	| newForm newSurface cr origin |

	origin := aRect origin.
	newForm := Form extent: aRect extent depth: 32.
	newForm 
		copy: (0@0 extent: aRect extent)
		from: origin 
		in: self form 
		rule: Form over.

	"debugForm := Form extent: aRect extent depth: 32.
	debugForm fill: (0@0 extent: aRect extent) rule: Form over fillColor: Color blue.
	newForm
		copy: (0@0 extent: aRect extent)
		from: 0@0
		in: debugForm 
		rule: Form blend."
			
	newSurface := AthensCairoSurface fromForm: newForm.
	cr := self cairoCreate: self activeSurface getHandle.
	[
		self 
			setSourceSurfaceTo: cr 
			surface: newSurface getHandle
			x: origin x asFloat
			y: origin y asFloat.
		self paint: cr ]
	ensure: [ 
		self cairoDestroy: cr ]
]

{ #category : #'private updating' }
GtkFormView >> updateSurfaceRectangles: rects [
	| mergedRect |
	
	mergedRect := rects size = 1 
		ifTrue: [ rects first ]
		ifFalse:[ Rectangle merging: rects ].

	mergedRect extent = self currentExtent 
		ifTrue: [ ^ self updateAllSurface ].
	self updateSurfaceRectangle: mergedRect
]

{ #category : #accessing }
GtkFormView >> world [ 

	^ self eventHandler morphicWorld
]
