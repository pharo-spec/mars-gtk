Class {
	#name : #SpecGridPresenter,
	#superclass : #AbstractWidgetPresenter,
	#instVars : [
		'contents'
	],
	#category : #'Mars-Spec-Examples'
}

{ #category : #specs }
SpecGridPresenter class >> adapterName [
	
	^ #GridAdapter
]

{ #category : #adding }
SpecGridPresenter >> add: anAssociation [ 
	
	self 
		add: anAssociation key 
	 	constraints: anAssociation value
]

{ #category : #adding }
SpecGridPresenter >> add: aPresenterOrSymbol constraints: aSpecGridConstraint [

	contents 
		at: aPresenterOrSymbol 
		put: aSpecGridConstraint
]

{ #category : #initialization }
SpecGridPresenter >> initialize [ 

	super initialize.
	contents := OrderedDictionary new
]
