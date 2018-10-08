Class {
	#name : #MarsBrowserModel,
	#superclass : #Object,
	#category : #'Mars-IDE'
}

{ #category : #'instance creation' }
MarsBrowserModel >> open [ 

	^ self buildBrowser showAll
]
