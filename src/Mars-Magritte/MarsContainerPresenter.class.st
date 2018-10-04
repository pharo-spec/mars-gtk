"
I'm a presenter for a collection of descriptions, tipically those that  are built when sending #magritteDescription to an object.
I build a container that can be used to display teh editor, sending #widget.

"
Class {
	#name : #MarsContainerPresenter,
	#superclass : #MarsDescriptionPresenter,
	#instVars : [
		'children',
		'answerBlock'
	],
	#category : 'Mars-Magritte'
}

{ #category : #accessing }
MarsContainerPresenter class >> defaultChildPadding [
	^ 2
]

{ #category : #private }
MarsContainerPresenter >> acceptEdition [ 
	self children do: #acceptEdition
]

{ #category : #accessing }
MarsContainerPresenter >> addButtons [
	self addButtons: { 
		MarsButtonPresenter label: 'Accept' icon: #smallOk asIcon action: [ :this | this save ].
		MarsButtonPresenter label: 'Cancel' icon: #smallCancel asIcon action: [ :this | this cancel ] 
	}
]

{ #category : #accessing }
MarsContainerPresenter >> addButtons: anArray [
	self widget 
		packEnd: (self buildButtons: anArray) 
		expand: false 
		fill: false 
		padding: 0
]

{ #category : #answering }
MarsContainerPresenter >> answer: anObject [
	| didUserCancel |

	didUserCancel := anObject isNil.
	didUserCancel | answerBlock isNil ifTrue: [ ^ self ].

	answerBlock value: anObject.
]

{ #category : #private }
MarsContainerPresenter >> basicAdoptMemento: aMemento [ 
	super basicAdoptMemento: aMemento.
	self children do: [ :each | each adoptMemento: aMemento ]
]

{ #category : #'private building' }
MarsContainerPresenter >> buildButtons: anArray [
	| buttonsBox |
	buttonsBox := GtkBox newHorizontal.
	anArray do: [ :each | 
		buttonsBox packEnd: (each widgetOn: self) expand: false fill: false padding: 2  ].
	^ buttonsBox
	
]

{ #category : #'private building' }
MarsContainerPresenter >> buildChildren [
	^ Array streamContents: [ :stream |
		self magritteDescription do: [ :each |
			each isVisible ifTrue: [
				stream nextPut: (each presenterClass
					memento: self memento
					description: each
					parent: self) ] ] ]
]

{ #category : #'private building' }
MarsContainerPresenter >> buildWidget [
	| newWidget |
	newWidget := GtkBox newVertical.
	self children do: [ :each | 
		newWidget 
			packStart: each widget 
			expand: false 
			fill: true 
			padding: self class defaultChildPadding ].
	^ newWidget
]

{ #category : #actions }
MarsContainerPresenter >> cancel [
	self reset; answer: nil
]

{ #category : #accessing }
MarsContainerPresenter >> children [
	^ children
]

{ #category : #private }
MarsContainerPresenter >> children: anArray [ 
	children := anArray
]

{ #category : #private }
MarsContainerPresenter >> description: aDescription [
	super description: aDescription.
	self children: self buildChildren
]

{ #category : #answering }
MarsContainerPresenter >> onAnswer: aBlock [
	answerBlock := aBlock
]

{ #category : #private }
MarsContainerPresenter >> resetEdition [
	self children do: #resetEdition
]

{ #category : #actions }
MarsContainerPresenter >> save [
	[ self validate ]
		on: MAValidationError
		do: [ :err | ^ self inform: err greaseString ].
	self commit; answer: self model
]
