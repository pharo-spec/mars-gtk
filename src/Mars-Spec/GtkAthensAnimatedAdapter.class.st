Class {
	#name : #GtkAthensAnimatedAdapter,
	#superclass : #GtkAthensStaticAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #initialization }
GtkAthensAnimatedAdapter >> updateModelToMoment: tick [
	self redraw
]
