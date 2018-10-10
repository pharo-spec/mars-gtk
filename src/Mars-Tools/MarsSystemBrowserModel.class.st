Class {
	#name : #MarsSystemBrowserModel,
	#superclass : #MarsModel,
	#category : #'Mars-Tools'
}

{ #category : #accessing }
MarsSystemBrowserModel >> environment [ 

	^ ClySystemEnvironment currentImage
]

{ #category : #accessing }
MarsSystemBrowserModel >> title [

	^ 'Untitled'
]
