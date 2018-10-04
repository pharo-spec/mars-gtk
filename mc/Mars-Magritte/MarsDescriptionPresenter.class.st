"
I'm an abstract presenter for descriptions.
"
Class {
	#name : #MarsDescriptionPresenter,
	#superclass : #Object,
	#instVars : [
		'memento',
		'description',
		'parent',
		'widget'
	],
	#category : 'Mars-Magritte'
}

{ #category : #'instance creation' }
MarsDescriptionPresenter class >> memento: aMemento [
	^ self memento: aMemento description: aMemento magritteDescription
]

{ #category : #'instance creation' }
MarsDescriptionPresenter class >> memento: aMemento description: aDescription [
	^ self memento: aMemento description: aDescription parent: nil
]

{ #category : #'instance creation' }
MarsDescriptionPresenter class >> memento: aMemento description: aDescription parent: aWidget [
	^ self new
		memento: aMemento;
		description: aDescription;
		parent: aWidget;
		yourself
]

{ #category : #private }
MarsDescriptionPresenter >> acceptEdition [
	self subclassResponsibility
]

{ #category : #actions }
MarsDescriptionPresenter >> adoptMemento: aMemento [
	self basicAdoptMemento: aMemento.
	self resetEdition.
	self widget showAll
]

{ #category : #private }
MarsDescriptionPresenter >> basicAdoptMemento: aMemento [
	memento := aMemento
]

{ #category : #'private building' }
MarsDescriptionPresenter >> buildWidget [
	^ self subclassResponsibility
]

{ #category : #actions }
MarsDescriptionPresenter >> commit [
	self memento commit
]

{ #category : #accessing }
MarsDescriptionPresenter >> description [
	^ description
]

{ #category : #private }
MarsDescriptionPresenter >> description: anObject [
	description := anObject
]

{ #category : #accessing }
MarsDescriptionPresenter >> magritteDescription [
	^ description
]

{ #category : #accessing }
MarsDescriptionPresenter >> memento [
	^ memento
]

{ #category : #private }
MarsDescriptionPresenter >> memento: anObject [
	memento := anObject
]

{ #category : #accessing }
MarsDescriptionPresenter >> model [
	^ self memento model
]

{ #category : #accessing }
MarsDescriptionPresenter >> parent [
	^ parent
]

{ #category : #private }
MarsDescriptionPresenter >> parent: anObject [
	parent := anObject
]

{ #category : #actions }
MarsDescriptionPresenter >> reset [
	self memento reset.
	self resetEdition.
	self widget showAll
]

{ #category : #private }
MarsDescriptionPresenter >> resetEdition [
	self subclassResponsibility
]

{ #category : #actions }
MarsDescriptionPresenter >> validate [
	"Flushes the cached state of some morphic elements (such as text-morphs) to the memento and then does the validation. I don't know of a better flush the morphic contents (happy flickering), probably morphic is just too limited to customize that easily or I am too dumb to find out."
	self acceptEdition.
	self memento validate
]

{ #category : #accessing }
MarsDescriptionPresenter >> widget [
	^ widget ifNil: [ widget := self buildWidget ]
]
