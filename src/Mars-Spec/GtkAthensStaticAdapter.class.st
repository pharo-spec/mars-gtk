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
	self surface drawDuring: [ :canvas | self presenter drawBlock cull: canvas ]
]

{ #category : #drawing }
GtkAthensStaticAdapter >> surface [
	^ surface
		ifNil: [ surface := AthensCairoSurface extent: self presenter surfaceExtent ]
]

{ #category : #building }
GtkAthensStaticAdapter >> widgetClass [
	^ GtkImage
]
