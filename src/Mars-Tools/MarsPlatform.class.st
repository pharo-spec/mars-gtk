Class {
	#name : #MarsPlatform,
	#superclass : #Object,
	#category : #'Mars-Tools'
}

{ #category : #testing }
MarsPlatform class >> isAvailable [

	^ false
]

{ #category : #'instance creation' }
MarsPlatform class >> newForPlatform [

	^ (self allSubclasses detect: #isAvailable) new
]

{ #category : #accessing }
MarsPlatform >> defaultTheme [

	^ self subclassResponsibility
]
