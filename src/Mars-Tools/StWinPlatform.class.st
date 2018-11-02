Class {
	#name : #StWinPlatform,
	#superclass : #StPlatform,
	#category : #'Mars-Tools'
}

{ #category : #testing }
StWinPlatform class >> isAvailable [

	^ Smalltalk os isWindows
]

{ #category : #accessing }
StWinPlatform >> defaultTheme [

	^ 'Windows-10-master'
]
