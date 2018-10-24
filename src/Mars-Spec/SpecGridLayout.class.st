Class {
	#name : #SpecGridLayout,
	#superclass : #Object,
	#instVars : [
		'presenters',
		'borderWidth',
		'columnSpacing',
		'rowSpacing'
	],
	#category : #'Mars-Spec-Examples'
}

{ #category : #initialization }
SpecGridLayout class >> defaultBorderWidth [

	^ 20
]

{ #category : #initialization }
SpecGridLayout class >> defaultColumnSpacing [

	^ 10
]

{ #category : #initialization }
SpecGridLayout class >> defaultRowSpacing [

	^ 5
]

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

	self error: 'Should not arrive here. This layout is executable then it will not be interpreted.'
]

{ #category : #accessing }
SpecGridLayout >> borderWidth [

	^ borderWidth ifNil: [ self class defaultBorderWidth ]
]

{ #category : #accessing }
SpecGridLayout >> borderWidth: anObject [
	borderWidth := anObject
]

{ #category : #building }
SpecGridLayout >> buildAdapterFor: aModel bindings: bindings [
	| adapter |

	adapter := (bindings adapterClass: #GridAdapter) adapt: aModel.
	adapter layout: self.
	presenters keysAndValuesDo: [ :selector :constraints |
		adapter 
			add: (aModel perform: selector) 
			constraints: constraints ].
	
	^ adapter
]

{ #category : #accessing }
SpecGridLayout >> columnSpacing [

	^ columnSpacing ifNil: [ self class defaultColumnSpacing ]
]

{ #category : #accessing }
SpecGridLayout >> columnSpacing: anObject [
	columnSpacing := anObject
]

{ #category : #initialization }
SpecGridLayout >> initialize [

	super initialize.
	presenters := OrderedDictionary new
]

{ #category : #testing }
SpecGridLayout >> isExecutable [

	^ true
]

{ #category : #testing }
SpecGridLayout >> isSpecLayout [

	^ true
]

{ #category : #accessing }
SpecGridLayout >> presenters [
	^ presenters
]

{ #category : #accessing }
SpecGridLayout >> presenters: anObject [
	presenters := anObject
]

{ #category : #accessing }
SpecGridLayout >> rowSpacing [

	^ rowSpacing ifNil: [ self class defaultRowSpacing ]
]

{ #category : #accessing }
SpecGridLayout >> rowSpacing: anObject [
	rowSpacing := anObject
]
