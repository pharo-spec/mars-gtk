Class {
	#name : #SpecExecutableLayout,
	#superclass : #Object,
	#instVars : [
		'children'
	],
	#category : #'Mars-Spec-Layout-Base'
}

{ #category : #private }
SpecExecutableLayout >> adapterName [

	^ self subclassResponsibility
]

{ #category : #accessing }
SpecExecutableLayout >> add: aName withConstraints: aBlock [
	| constraints |
	
	constraints := self constraintsClass new.
	aBlock value: constraints.
	children 
		at: aName 
		put: constraints
]

{ #category : #converting }
SpecExecutableLayout >> asArray [

	self error: 'Should not arrive here. This layout is executable then it will not be interpreted.'
]

{ #category : #building }
SpecExecutableLayout >> buildAdapterFor: aModel bindings: bindings [
	| adapter |

	adapter := (bindings adapterClass: self adapterName) adapt: aModel.
	adapter layout: self.
	children keysAndValuesDo: [ :presenterName :constraints |
		adapter 
			add: (aModel readSlotNamed: presenterName)
			constraints: constraints ].
	
	^ adapter
]

{ #category : #private }
SpecExecutableLayout >> constraintsClass [

	^ self subclassResponsibility
]

{ #category : #initialization }
SpecExecutableLayout >> initialize [ 

	super initialize.
	children := OrderedDictionary new
]

{ #category : #testing }
SpecExecutableLayout >> isExecutable [

	^ true
]

{ #category : #testing }
SpecExecutableLayout >> isSpecLayout [

	^ true
]
