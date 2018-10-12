Class {
	#name : #MarsPlayground,
	#superclass : #MarsPresenter,
	#instVars : [
		'text'
	],
	#category : #'Mars-Tools'
}

{ #category : #accessing }
MarsPlayground class >> defaultExtent [

	^ 600 @ 400
]

{ #category : #specs }
MarsPlayground class >> defaultSpec [

	^ SpecLayout composed
		newRow: #text
]

{ #category : #accessing }
MarsPlayground class >> defaultTitle [ 

	^ 'Playground'
]

{ #category : #api }
MarsPlayground >> initialExtent [ 

	^ self class defaultExtent
]

{ #category : #initialization }
MarsPlayground >> initialize [
	super initialize.
	self title: self class defaultTitle
]

{ #category : #initialization }
MarsPlayground >> initializeWidgets [
	
	text := self newText beForCode
]

{ #category : #'accessing ui' }
MarsPlayground >> text [
	^ text
]

{ #category : #'accessing ui' }
MarsPlayground >> text: anObject [
	text := anObject
]
