"
I'm a widget to display morphs. 
"
Class {
	#name : #GtkMorphArea,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'morph'
	],
	#category : 'Mars-Gtk-Widget'
}

{ #category : #private }
GtkMorphArea class >> drawingAreaNew [
	^ self ffiCall: #( GtkMorphArea *gtk_drawing_area_new () )
]

{ #category : #'instance creation' }
GtkMorphArea class >> newMorph: aMorph [
	^ self new 
		morph: aMorph;
		yourself

]

{ #category : #drawing }
GtkMorphArea >> drawOnAthensCanvas: aCanvas [
	"just forward to the morph"
	morph extent: self getAllocatedWidth @ self getAllocatedHeight.
	aCanvas surface drawDuring: [ :theCanvas |
		morph fullDrawOnAthensCanvas: aCanvas ]
]

{ #category : #private }
GtkMorphArea >> getAllocatedHeight [
	^ self ffiCall: #(int gtk_widget_get_allocated_height (self))
]

{ #category : #private }
GtkMorphArea >> getAllocatedWidth [
	^ self ffiCall: #(int gtk_widget_get_allocated_width (self))
]

{ #category : #accessing }
GtkMorphArea >> morph [ 
	^ morph
]

{ #category : #private }
GtkMorphArea >> morph: aMorph [
	morph := aMorph.
	self sizeRequest: aMorph extent.
]
