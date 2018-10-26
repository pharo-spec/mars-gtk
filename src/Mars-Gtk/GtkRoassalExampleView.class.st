Class {
	#name : #GtkRoassalExampleView,
	#superclass : #GtkDrawingArea,
	#instVars : [
		'view'
	],
	#category : #'Mars-Gtk-Examples'
}

{ #category : #private }
GtkRoassalExampleView class >> drawingAreaNew [
	^ self ffiCall: #( GtkRoassalExampleView *gtk_drawing_area_new () )
]

{ #category : #drawing }
GtkRoassalExampleView >> drawEmptyOn: aCanvas [
	
	aCanvas surface drawDuring: [ :canvas |
		canvas surface clear.
		canvas pathTransform loadIdentity.	
		canvas 
			setPaint: Color white;
			drawShape: (0@0 corner: self allocation extent) ]
]

{ #category : #drawing }
GtkRoassalExampleView >> drawOnAthensCanvas: aCanvas [
	
	self view 
		ifNotNil: [ self drawViewOn: aCanvas ]
		ifNil: [ self drawEmptyOn: aCanvas ]
]

{ #category : #drawing }
GtkRoassalExampleView >> drawViewOn: aCanvas [
	[| morph |
	
	morph := TRMorph new.
	morph canvas: self view canvas.
	aCanvas surface drawDuring: [ :canvas |
		morph drawOnAthensCanvas: canvas ]]
	on: Error fork: [ :e | e pass ]
]

{ #category : #accessing }
GtkRoassalExampleView >> view [
	^ view
]

{ #category : #accessing }
GtkRoassalExampleView >> view: aView [

	view := aView.
	self queueDraw
]
