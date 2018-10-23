Class {
	#name : #SpecFormExample,
	#superclass : #ComposablePresenter,
	#instVars : [
		'textInputLabel',
		'textInput',
		'numberInputLabel',
		'numberInput'
	],
	#category : #'Mars-Spec-Examples'
}

{ #category : #specs }
SpecFormExample class >> defaultSpec [ 
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :column |
			column
				newRow: [ :row |
					row 
						newColumn: #textInputLabel;
						newColumn: #textInput ]
					height: 25;
				newRow: [ :row |
					row 
						newColumn: #numberInputLabel;
						newColumn: #numberInput ]
					height: 25;
				addSpacer ]
	
	"^ SpecGridLayout new 
		add: #textInputLabel at: 1@1;
		add: #textInput at: 2@1;
		add: #numberInputLabel at: 1@2;
		add: #numberInput at: 2@2;
		yourself"
]

{ #category : #specs }
SpecFormExample class >> gridSpec [ 
	<spec: #grid>
	
	^ SpecGridLayout new 
		add: #textInputLabel at: 1@1;
		add: #textInput at: 2@1;
		add: #numberInputLabel at: 1@2;
		add: #numberInput at: 2@2;
		yourself
]

{ #category : #examples }
SpecFormExample class >> show [ 
	<example>
	
	self new openWithSpec
]

{ #category : #examples }
SpecFormExample class >> showWithGtk [
	<example>
	
	SpecBindings 
		value: GtkAdapterBindings
		during: [ self new openWithSpec": #gridSpec" ].


]

{ #category : #initialization }
SpecFormExample >> initializeWidgets [
	
	textInputLabel := self newLabel label: 'Text input'.
	textInput := self newTextInput 
		ghostText: 'a ghost text'.
		
	numberInputLabel := self newLabel label: 'Number input'.
	numberInput := self newTextInput 
		ghostText: 'a ghost text for number'.

]

{ #category : #accessing }
SpecFormExample >> numberInput [
	^ numberInput
]

{ #category : #accessing }
SpecFormExample >> numberInput: anObject [
	numberInput := anObject
]

{ #category : #accessing }
SpecFormExample >> numberInputLabel [
	^ numberInputLabel
]

{ #category : #accessing }
SpecFormExample >> numberInputLabel: anObject [
	numberInputLabel := anObject
]

{ #category : #accessing }
SpecFormExample >> textInput [
	^ textInput
]

{ #category : #accessing }
SpecFormExample >> textInput: anObject [
	textInput := anObject
]

{ #category : #accessing }
SpecFormExample >> textInputLabel [
	^ textInputLabel
]

{ #category : #accessing }
SpecFormExample >> textInputLabel: anObject [
	textInputLabel := anObject
]
