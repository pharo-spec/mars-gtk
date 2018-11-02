Class {
	#name : #StUnixPlatform,
	#superclass : #StPlatform,
	#category : #'Mars-Tools'
}

{ #category : #testing }
StUnixPlatform class >> isAvailable [

	^ Smalltalk os isUnix
]
