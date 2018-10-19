Class {
	#name : #MarsWinPlatform,
	#superclass : #MarsPlatform,
	#category : #'Mars-Tools'
}

{ #category : #testing }
MarsWinPlatform class >> isAvailable [

	^ Smalltalk os isWindows
]

{ #category : #accessing }
MarsWinPlatform >> defaultTheme [

	^ 'Windows-10-master'
]
