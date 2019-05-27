Class {
	#name : #GtkMorphicAlarm,
	#superclass : #MorphicAlarm,
	#instVars : [
		'process'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #scheduling }
GtkMorphicAlarm >> cancel [

	process ifNil: [ ^ self ].

	process terminate.
	process := nil
]

{ #category : #scheduling }
GtkMorphicAlarm >> schedule [

	process := [ 
		self waitUntilExecution.
		self value 
	] 
	fork
]

{ #category : #private }
GtkMorphicAlarm >> waitUntilExecution [

	(self scheduledTime - Time millisecondClockValue) milliseconds wait
]
