Class {
	#name : #StInspection,
	#superclass : #StPresenter,
	#instVars : [
		'model'
	],
	#category : #'Mars-Tools-Inspector'
}

{ #category : #'model access' }
StInspection >> model [
	^ model
]

{ #category : #'model access' }
StInspection >> model: anObject [
	model := anObject
]

{ #category : #'model access' }
StInspection >> setModelBeforeInitialization: anObject [ 

	model := anObject
]
