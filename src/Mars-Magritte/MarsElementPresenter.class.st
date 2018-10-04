"
I'm an abstract presenter for all basic description types. 
By default, I show just a text with my contents.
"
Class {
	#name : #MarsElementPresenter,
	#superclass : #MarsDescriptionPresenter,
	#instVars : [
		'editorWidget'
	],
	#category : 'Mars-Magritte'
}

{ #category : #geometry }
MarsElementPresenter class >> defaultBorderWidth [
	^ 4
]

{ #category : #accessing }
MarsElementPresenter class >> defaultLabelPadding [
	^ 5
]

{ #category : #accessing }
MarsElementPresenter class >> defaultLabelWidth [
	^ 120
]

{ #category : #geometry }
MarsElementPresenter class >> defaultLineHeight [
	"This is the height of a regular line... a GtkEntry or wathever. Some components needs them to 
	 calculate height"
	^ 15
]

{ #category : #private }
MarsElementPresenter >> acceptEdition [
	self string: editorWidget text
]

{ #category : #'private building' }
MarsElementPresenter >> buildEditorWidget [
	^ GtkEntry new text: self string
]

{ #category : #'private building' }
MarsElementPresenter >> buildLabelWidget [
	^ GtkLabel newLabel: self magritteDescription label
]

{ #category : #'private building' }
MarsElementPresenter >> buildViewWidget [
	^ GtkLabel newLabel: self string
]

{ #category : #'private building' }
MarsElementPresenter >> buildWidget [
	^ GtkBox newHorizontal
		packStart: (GtkBox newHorizontal 
				packStart: self buildLabelWidget padding: self class defaultLabelPadding;
				sizeRequest: self class defaultLabelWidth@(-1);
				yourself) 
			expand: false
			fill: false
			padding: 0;
		packStart: (editorWidget := (self magritteDescription isReadonly
			ifTrue: [ self buildViewWidget ]
			ifFalse: [ self buildEditorWidget ])); 
		yourself.

]

{ #category : #private }
MarsElementPresenter >> resetEdition [
	editorWidget text: self string
]

{ #category : #accessing }
MarsElementPresenter >> string [
	^ self magritteDescription toString: self value
]

{ #category : #accessing }
MarsElementPresenter >> string: aString [
	| value |
	value := self magritteDescription fromString: aString greaseString.
	self value: value.
	"self changed: #string"
]

{ #category : #accessing }
MarsElementPresenter >> value [
	^ self memento readUsing: self magritteDescription
]

{ #category : #accessing }
MarsElementPresenter >> value: anObject [
	self memento write: anObject using: self magritteDescription.
	"self changed: #value"
]
