Class {
	#name : #STxStyleTag,
	#superclass : #Object,
	#instVars : [
		'name',
		'start',
		'stop'
	],
	#category : #'Mars-Spec-Text'
}

{ #category : #'instance creation' }
STxStyleTag class >> newName: aString from: start to: stop [

	^ self basicNew 
		initializeName: aString from: start to: stop;
		yourself
]

{ #category : #visiting }
STxStyleTag >> acceptTextBuffer: textBuffer [

	textBuffer 
		applyTagByName: self name asString
		start: self start - 1
		end: self stop
]

{ #category : #initialization }
STxStyleTag >> initializeName: aString from: startNumber to: stopNumber [

	self initialize.
	name := aString.
	start := startNumber.
	stop := stopNumber
]

{ #category : #accessing }
STxStyleTag >> name [

	^ name
]

{ #category : #printing }
STxStyleTag >> printOn: aStream [ 
	
	aStream << self name << ' (' << self start asString << '-' << self stop asString << ')'
]

{ #category : #accessing }
STxStyleTag >> start [

	^ start
]

{ #category : #accessing }
STxStyleTag >> stop [

	^ stop
]
