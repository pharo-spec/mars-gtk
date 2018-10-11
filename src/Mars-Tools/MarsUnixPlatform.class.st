Class {
	#name : #MarsUnixPlatform,
	#superclass : #MarsPlatform,
	#category : #'Mars-Tools'
}

{ #category : #testing }
MarsUnixPlatform class >> isAvailable [

	^ Smalltalk os isUnix
]
