Class {
	#name : #GtkExampleTraceMovementMorph,
	#superclass : #Morph,
	#instVars : [
		'positionMorph'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #'events-processing' }
GtkExampleTraceMovementMorph >> handleMouseMove: anEvent [

	positionMorph contents: anEvent position asString.
	self changed
]

{ #category : #'events-processing' }
GtkExampleTraceMovementMorph >> handlesMouseMove: evt [

	^ true
]

{ #category : #initialization }
GtkExampleTraceMovementMorph >> initialize [

	super initialize.
	
	self changeTableLayout.
	self addMorph: (positionMorph := StringMorph contents: '[Position]')
]
