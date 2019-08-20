"
I'm a recurrent alarm. 
I'm used to implement the steping property of morphs in the context of a GtkMorphView.
"
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

{ #category : #accessing }
GtkStepMessage >> stepTime [

	^ super stepTime 
		ifNil: [ self receiver stepTime ]
]

{ #category : #private }
GtkStepMessage >> waitUntilExecution [

	self stepTime milliseconds wait
]
