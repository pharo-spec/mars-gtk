Class {
	#name : #TableColumn,
	#superclass : #Object,
	#instVars : [
		'title',
		'evaluation',
		'width'
	],
	#category : #'Mars-Tools-Inspector'
}

{ #category : #visiting }
TableColumn >> acceptColumnBuilder: aBuilder [

	^ self subclassResponsibility
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

{ #category : #accessing }
TableColumn >> width [
	^ width
]

{ #category : #accessing }
TableColumn >> width: anObject [
	width := anObject
]
