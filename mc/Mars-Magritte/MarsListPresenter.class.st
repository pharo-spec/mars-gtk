Class {
	#name : #MarsListPresenter,
	#superclass : #MarsElementPresenter,
	#category : 'Mars-Magritte'
}

{ #category : #'as yet unclassified' }
MarsListPresenter class >> defaultOptionsCount [
	^ 8
]

{ #category : #private }
MarsListPresenter >> acceptEdition [ 
	self flag: #todo.
]

{ #category : #accessing }
MarsListPresenter >> options [
	^ self magritteDescription allOptions
]

{ #category : #private }
MarsListPresenter >> resetEdition [ 
	self flag: #todo.
]

{ #category : #'accessing-dynamic' }
MarsListPresenter >> strings [
	^ self options collect: [ :each | self magritteDescription reference toString: each ]
]
