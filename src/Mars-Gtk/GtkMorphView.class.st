"
I'm a widget to display morphs. 
"
Class {
	#name : #GtkMorphView,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'morph',
		'morphSurface'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #private }
GtkMorphView class >> drawingAreaNew [
	^ self ffiCall: #(GtkMorphView *gtk_drawing_area_new ())
]

{ #category : #'instance creation' }
GtkMorphView class >> newMorph: aMorph [
	^ self new 
		morph: aMorph;
		yourself

]

{ #category : #drawing }
GtkMorphView >> drawOnAthensCanvas: aCanvas [

	aCanvas surface directDrawDuring: [ :canvas |
		canvas 
			setPaint: self morphSurface;
			setShape: (0@0 extent: self size);
			draw ]
]

{ #category : #accessing }
GtkMorphView >> morph [ 
	^ morph
]

{ #category : #private }
GtkMorphView >> morph: aMorph [

	morph := aMorph.
	self sizeRequest: aMorph extent
]

{ #category : #drawing }
GtkMorphView >> morphSurface [
	
	^ morphSurface ifNil: [ morphSurface := self newMorphSurface ]
]

{ #category : #drawing }
GtkMorphView >> newMorphSurface [
	| newSurface |

	newSurface := AthensCairoSurface extent: self morph extent.
	newSurface drawDuring: [ :canvas |
		self morph fullDrawOnAthensCanvas: canvas ].
	^ newSurface
]
