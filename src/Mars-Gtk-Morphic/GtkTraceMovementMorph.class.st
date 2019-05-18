Class {
	#name : #GtkTraceMovementMorph,
	#superclass : #Morph,
	#instVars : [
		'positionMorph'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #'events-processing' }
GtkTraceMovementMorph >> handleMouseMove: anEvent [

	positionMorph contents: anEvent position asString
]

{ #category : #'events-processing' }
GtkTraceMovementMorph >> handlesMouseMove: evt [

	^ true
]

{ #category : #initialization }
GtkTraceMovementMorph >> initialize [

	super initialize.
	self addMorphBack: (positionMorph := StringMorph new).
]
