Extension { #name : #Object }

{ #category : #'*Mars-Magritte' }
Object >> asPresenter [
	^ self magritteDescription asPresenterOn: self
]

{ #category : #'*Mars-Magritte' }
Object >> mementoWith: aDescription [
	^ self mementoClass
		model: self
		description: aDescription
]
