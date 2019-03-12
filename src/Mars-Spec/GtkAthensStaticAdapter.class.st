Class {
	#name : #GtkAthensStaticAdapter,
	#superclass : #GtkAdapter,
	#instVars : [
		'surface'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkAthensStaticAdapter >> addModelTo: gtkWidget [
	super addModelTo: gtkWidget.

	
]

{ #category : #drawing }
GtkAthensStaticAdapter >> redraw [
	| pixbuf |
	self surface drawDuring: [ :canvas | self presenter drawBlock cull: canvas ].
	pixbuf := (GdkPixbuf
		getFromSurface: self surface
		x: 0
		y: 0
		width: self presenter surfaceExtent x asInteger
		height: self presenter surfaceExtent y asInteger) initialize.
	self widget setFromGdkPixbuf: pixbuf
]

{ #category : #drawing }
GtkAthensStaticAdapter >> surface [
	^ surface
		ifNil:
			[ surface := AthensCairoSurface extent: self presenter surfaceExtent ]
]

{ #category : #building }
GtkAthensStaticAdapter >> widgetClass [
	^ GtkImage
]
