Class {
	#name : #GtkBlockBasedDrawingArea,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'drawBlock'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #private }
GtkBlockBasedDrawingArea class >> drawingAreaNew [
	^ self ffiCall: #( GtkBlockBasedDrawingArea *gtk_drawing_area_new () )
]

{ #category : #'instance creation' }
GtkBlockBasedDrawingArea class >> newBlock: aBlock [

	^ self new 
		drawBlock: aBlock;
		yourself
]

{ #category : #drawing }
GtkBlockBasedDrawingArea >> drawBlock [
	^ drawBlock
]

{ #category : #drawing }
GtkBlockBasedDrawingArea >> drawBlock: aBlock [
	drawBlock := aBlock
]

{ #category : #drawing }
GtkBlockBasedDrawingArea >> drawOnAthensCanvas: aCanvas [
	aCanvas surface directDrawDuring: [ :canvas | | boundingBox |
		boundingBox := self boundingBox.
		canvas 
			clipBy: boundingBox 
			during: [ drawBlock cull: canvas cull: boundingBox ] ]
]
