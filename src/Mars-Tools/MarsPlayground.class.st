Class {
	#name : #MarsPlayground,
	#superclass : #ComposablePresenter,
	#instVars : [
		'text'
	],
	#category : #'Mars-Tools'
}

{ #category : #specs }
MarsPlayground class >> defaultSpec [

	^ SpecLayout composed
		newRow: #text
]

{ #category : #initialization }
MarsPlayground >> initializeWidgets [
	
	text := self newText
]

{ #category : #accessing }
MarsPlayground >> text [
	^ text
]

{ #category : #accessing }
MarsPlayground >> text: anObject [
	text := anObject
]
