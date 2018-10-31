Class {
	#name : #SpecBoxLayout,
	#superclass : #SpecExecutableLayout,
	#instVars : [
		'direction'
	],
	#category : #'Mars-Spec-Layout-Box'
}

{ #category : #'instance creation' }
SpecBoxLayout class >> new [ 

	self error: 'Use one of my siblings'
]

{ #category : #'instance creation' }
SpecBoxLayout class >> newHorizontal [ 

	^ super new beHorizontal
]

{ #category : #'instance creation' }
SpecBoxLayout class >> newVertical [ 

	^ super new beVertical
]

{ #category : #private }
SpecBoxLayout >> adapterName [

	^ #BoxAdapter
]

{ #category : #adding }
SpecBoxLayout >> add: aName [

	self 
		add: aName 
		withConstraints: [ :constraints | ]
]

{ #category : #adding }
SpecBoxLayout >> add: aName expand: shouldExpand fill: shouldFill padding: aNumber [

	self 
		add: aName 
		withConstraints: [ :constraints |
			constraints 
				expand: shouldExpand;
				fill: shouldFill; 
				padding: aNumber ]
]

{ #category : #adding }
SpecBoxLayout >> addLast: aName [

	self 
		addLast: aName 
		withConstraints: [ :constraints | ]
]

{ #category : #adding }
SpecBoxLayout >> addLast: aName expand: shouldExpand fill: shouldFill padding: aNumber [

	self 
		addLast: aName 
		withConstraints: [ :constraints |
			constraints 
				expand: shouldExpand;
				fill: shouldFill; 
				padding: aNumber ]
]

{ #category : #adding }
SpecBoxLayout >> addLast: aName withConstraints: aBlock [

	self 
		add: aName 
		withConstraints: [ :constraints |
			constraints bePlacedAtEnd.
			aBlock value: constraints ]
]

{ #category : #initialization }
SpecBoxLayout >> beHorizontal [

	direction := SpecBoxLayoutDirection horizontal
]

{ #category : #initialization }
SpecBoxLayout >> beVertical [

	direction := SpecBoxLayoutDirection vertical
]

{ #category : #private }
SpecBoxLayout >> constraintsClass [

	^ SpecBoxConstraints
]

{ #category : #accessing }
SpecBoxLayout >> direction [ 

	^ direction
]
