Class {
	#name : #MarsWinPlatform,
	#superclass : #MarsPlatform,
	#category : #'Mars-Tools'
}

{ #category : #testing }
MarsWinPlatform class >> isAvailable [

	^ Smalltalk os isWindows
]

{ #category : #'as yet unclassified' }
MarsWinPlatform >> defaultTheme [

	^ 'Windows10'
]
