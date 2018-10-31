Class {
	#name : #SpecBoxLayoutDirection,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Mars-Spec-Layout-Box'
}

{ #category : #accessing }
SpecBoxLayoutDirection class >> horizontal [

	^ SpecBoxLayoutDirectionHorizontal uniqueInstance
]

{ #category : #accessing }
SpecBoxLayoutDirection class >> uniqueInstance [ 
	
	self = SpecBoxLayoutDirection ifTrue: [ 
		self error: 'I''m abstract, use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #accessing }
SpecBoxLayoutDirection class >> vertical [

	^ SpecBoxLayoutDirectionVertical uniqueInstance
]

{ #category : #factory }
SpecBoxLayoutDirection >> newWidgetOn: anAdapter [

	^ self subclassResponsibility
]
