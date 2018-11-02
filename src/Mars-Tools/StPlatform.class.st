Class {
	#name : #StPlatform,
	#superclass : #Object,
	#category : #'Mars-Tools'
}

{ #category : #testing }
StPlatform class >> isAvailable [

	^ false
]

{ #category : #'instance creation' }
StPlatform class >> newForPlatform [

	^ (self allSubclasses detect: #isAvailable) new
]

{ #category : #accessing }
StPlatform >> defaultTheme [

	^ self subclassResponsibility
]
