Class {
	#name : #MarsSystemBrowserModel,
	#superclass : #MarsModel,
	#category : #'Mars-IDE'
}

{ #category : #accessing }
MarsSystemBrowserModel >> environment [ 

	^ ClySystemEnvironment currentImage
]

{ #category : #accessing }
MarsSystemBrowserModel >> title [

	^ 'Untitled'
]
