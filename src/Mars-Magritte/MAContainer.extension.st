Extension { #name : #MAContainer }

{ #category : #'*Mars-Magritte' }
MAContainer >> asPresenterOn: anObject [
	^ self presenterClass memento: (anObject mementoWith: self)
]

{ #category : #'*Mars-Magritte' }
MAContainer classSide >> defaultPresenterClass [
	^ MarsContainerPresenter
]
