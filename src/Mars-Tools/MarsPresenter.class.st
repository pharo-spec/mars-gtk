Class {
	#name : #MarsPresenter,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Mars-Tools'
}

{ #category : #accessing }
MarsPresenter >> model [
	^ model
]

{ #category : #accessing }
MarsPresenter >> model: anObject [
	model := anObject
]
