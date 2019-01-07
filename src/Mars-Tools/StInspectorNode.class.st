Class {
	#name : #StInspectorNode,
	#superclass : #Object,
	#instVars : [
		'object'
	],
	#category : #'Mars-Tools-Inspector'
}

{ #category : #accessing }
StInspectorNode >> name [

	^ self subclassResponsibility
]

{ #category : #accessing }
StInspectorNode >> object [
	^ object
]

{ #category : #private }
StInspectorNode >> object: anObject [

	object := anObject
]

{ #category : #accessing }
StInspectorNode >> stringValue [ 

	^ self value printString
]

{ #category : #accessing }
StInspectorNode >> value [

	^ self subclassResponsibility
]
