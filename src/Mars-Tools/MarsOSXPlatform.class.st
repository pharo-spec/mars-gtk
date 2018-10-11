Class {
	#name : #MarsOSXPlatform,
	#superclass : #MarsPlatform,
	#category : #'Mars-Tools'
}

{ #category : #testing }
MarsOSXPlatform class >> isAvailable [

	^ Smalltalk os isMacOS
]

{ #category : #'as yet unclassified' }
MarsOSXPlatform >> defaultTheme [

	^ 'Sierra-dark'
]
