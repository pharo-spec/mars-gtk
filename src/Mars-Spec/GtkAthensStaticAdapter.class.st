Class {
	#name : #GtkAthensStaticAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkAthensStaticAdapter >> addModelTo: gtkWidget [
	super addModelTo: gtkWidget.
	gtkWidget drawBlock: self presenter drawBlock.
"	gtkWidget extent: self presenter surfaceExtent."
	self presenter
		whenDrawBlockChangedDo: [ :newBlock | self widget drawBlock: newBlock ].
"	self presenter
		whenExtentChangedDo: [ :newExtent | self widget extent: newExtent ]"
]

{ #category : #drawing }
GtkAthensStaticAdapter >> redraw [
	self widget queueDraw
]

{ #category : #building }
GtkAthensStaticAdapter >> widgetClass [
	^ GtkBlockBasedDrawingArea 
]
