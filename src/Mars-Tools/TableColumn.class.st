Class {
	#name : #TableColumn,
	#superclass : #Object,
	#instVars : [
		'title',
		'evaluation',
		'editable',
		'acceptAction'
	],
	#category : #'Mars-Tools-Inspector'
}

{ #category : #accessing }
TableColumn >> beEditable [ 

	editable := true
]

{ #category : #accessing }
TableColumn >> evaluated: aValuable [

	evaluation := aValuable
]

{ #category : #accessing }
TableColumn >> evaluation [
	^ evaluation
]

{ #category : #accessing }
TableColumn >> evaluation: anObject [
	evaluation := anObject
]

{ #category : #initialization }
TableColumn >> initialize [ 

	super initialize.
	editable := false
]

{ #category : #testing }
TableColumn >> isEditable [ 
	
	^ editable
]

{ #category : #accessing }
TableColumn >> onAcceptEdition: aBlock [

	acceptAction := aBlock
]

{ #category : #accessing }
TableColumn >> readObject: anObject [ 

	^ self evaluation value: anObject
]

{ #category : #accessing }
TableColumn >> title [
	^ title
]

{ #category : #accessing }
TableColumn >> title: anObject [
	title := anObject
]
