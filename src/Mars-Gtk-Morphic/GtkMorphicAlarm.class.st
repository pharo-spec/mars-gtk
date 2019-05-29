"
I represent a message to be scheduled by the WorldState.
I'm used to implement the alarm property of morphs in the context of a GtkMorphView.

once scheduled, an alarm will wait until its execution.
"
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
		self value: Time millisecondClockValue
	] 
	fork
]

{ #category : #private }
GtkMorphicAlarm >> waitUntilExecution [

	(self scheduledTime - Time millisecondClockValue) milliseconds wait
]
