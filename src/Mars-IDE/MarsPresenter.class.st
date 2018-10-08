Class {
	#name : #MarsPresenter,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Mars-IDE'
}

{ #category : #accessing }
MarsPresenter >> model [
	^ model
]

{ #category : #accessing }
MarsPresenter >> model: anObject [
	model := anObject
]
