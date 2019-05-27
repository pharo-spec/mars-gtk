Class {
	#name : #GtkStepMessage,
	#superclass : #StepMessage,
	#instVars : [
		'process'
	],
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #scheduling }
GtkStepMessage >> cancel [

	process ifNil: [ ^ self ].

	process terminate.
	process := nil
]

{ #category : #scheduling }
GtkStepMessage >> schedule [

	process := [ 
		[ true ] whileTrue: [ 
			self waitUntilExecution.
			self value: Time millisecondClockValue ] ] 
	fork
]

{ #category : #private }
GtkStepMessage >> waitUntilExecution [

	self stepTime wait
]
