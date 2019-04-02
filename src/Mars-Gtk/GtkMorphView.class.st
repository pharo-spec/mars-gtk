"
I'm a widget to display morphs. 
"
Class {
	#name : #GtkMorphView,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'morph'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #private }
GtkMorphView class >> drawingAreaNew [
	^ self ffiCall: #( #GtkMorphView *gtk_drawing_area_new () )
]

{ #category : #'instance creation' }
GtkMorphView class >> newMorph: aMorph [
	^ self new 
		morph: aMorph;
		yourself

]

{ #category : #drawing }
GtkMorphView >> drawOnAthensCanvas: aCanvas [
	"just forward to the morph"

	morph extent: self allocation extent.
	aCanvas surface directDrawDuring: [ :canvas |
		morph fullDrawOnAthensCanvas: canvas ]
]

{ #category : #accessing }
GtkMorphView >> morph [ 
	^ morph
]

{ #category : #private }
GtkMorphView >> morph: aMorph [
	morph := aMorph.
	self sizeRequest: aMorph extent.
]
