Class {
	#name : #GtkAthensExampleView,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'baseMorph'
	],
	#category : #'Mars-Gtk-Examples'
}

{ #category : #private }
GtkAthensExampleView class >> drawingAreaNew [
	^ self ffiCall: #( GtkAthensExampleView *gtk_drawing_area_new () )
]

{ #category : #accessing }
GtkAthensExampleView class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_athens_example_view_get_type())
]

{ #category : #drawing }
GtkAthensExampleView >> drawOnAthensCanvas: aCanvas [

	aCanvas surface drawDuring: [ :canvas |
		canvas surface clear.
		canvas pathTransform loadIdentity.
		canvas 
			setPaint: Color lightGray;
			drawShape: (0@0 corner: self allocation extent).
		baseMorph 
			perform: (baseMorph figures at: baseMorph current) 
			with: canvas ]
]

{ #category : #initialization }
GtkAthensExampleView >> initialize [
	
	baseMorph := AthensDemoMorph new.
	super initialize.
]

{ #category : #actions }
GtkAthensExampleView >> next [ 

	baseMorph nextFigure.
	self queueDraw
]

{ #category : #actions }
GtkAthensExampleView >> previous [

	baseMorph prevFigure.
	self queueDraw
]
