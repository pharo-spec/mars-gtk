Class {
	#name : #SpecGridConstraints,
	#superclass : #Object,
	#instVars : [
		'position',
		'span'
	],
	#category : #'Mars-Spec-Examples'
}

{ #category : #accessing }
SpecGridConstraints >> position [
	^ position
]

{ #category : #accessing }
SpecGridConstraints >> position: anObject [
	position := anObject
]

{ #category : #accessing }
SpecGridConstraints >> span [
	^ span
]

{ #category : #accessing }
SpecGridConstraints >> span: anObject [
	span := anObject
]
