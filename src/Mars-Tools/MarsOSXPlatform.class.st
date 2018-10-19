Class {
	#name : #MarsOSXPlatform,
	#superclass : #MarsPlatform,
	#category : #'Mars-Tools'
}

{ #category : #testing }
MarsOSXPlatform class >> isAvailable [

	^ Smalltalk os isMacOS
]

{ #category : #accessing }
MarsOSXPlatform >> defaultTheme [
	"There are several available: 
		- Sierra-light
		- Sierra-dark
		- McOS-MJV-Light-1.1
		- McOS-MJV-Dark-1.1"

	^ 'McOS-MJV-Dark-1.1'
]
