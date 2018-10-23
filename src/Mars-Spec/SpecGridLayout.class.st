Class {
	#name : #SpecGridLayout,
	#superclass : #Object,
	#instVars : [
		'presenters'
	],
	#category : #'Mars-Spec-Examples'
}

{ #category : #adding }
SpecGridLayout >> add: aPresenterOrSymbol at: aPoint [

	^ self 
		add: aPresenterOrSymbol 
		at: aPoint
		span: 1@1
]

{ #category : #adding }
SpecGridLayout >> add: aPresenterOrSymbol at: aPoint span: spanPoint [

	^ self 
		add: aPresenterOrSymbol 
		withConstraints: [ :constraints |
			constraints 
				position: aPoint;
				span: spanPoint ]
]

{ #category : #adding }
SpecGridLayout >> add: aPresenterOrSymbol withConstraints: aBlock [ 
	| constraints |
	
	constraints := SpecGridConstraints new.
	aBlock value: constraints.
	presenters 
		at: aPresenterOrSymbol 
		put: constraints
]

{ #category : #converting }
SpecGridLayout >> asArray [
	| array |
	
	array := OrderedCollection with: #GridPresenter.
	presenters keysAndValuesDo: [ :presenter :constraints |
		array 
			add: #add:;
			add: { presenter -> constraints } ].
	
	^ array asArray
]

{ #category : #initialization }
SpecGridLayout >> initialize [

	super initialize.
	presenters := OrderedDictionary new
]

{ #category : #testing }
SpecGridLayout >> isSpecLayout [

	^ true
]
