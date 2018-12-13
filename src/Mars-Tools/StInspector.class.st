Class {
	#name : #StInspector,
	#superclass : #StPresenter,
	#instVars : [
		'list',
		'text'
	],
	#category : #'Mars-Tools-Inspector'
}

{ #category : #specs }
StInspector class >> defaultSpec [

	^ SpecBoxLayout newVertical
		add: #list;
		add: #text;
		yourself
]

{ #category : #'instance creation' }
StInspector class >> openOn: anObject [

	^ (self on: anObject) openWithSpec
]

{ #category : #initialization }
StInspector >> initializeWidgets [

	list := self newList.
	text := self newText beForCode
]
