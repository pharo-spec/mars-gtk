Class {
	#name : #GridPresenter,
	#superclass : #AbstractWidgetPresenter,
	#instVars : [
		'contents'
	],
	#category : #'Mars-Spec-Examples'
}

{ #category : #specs }
GridPresenter class >> adapterName [
	
	^ #GridAdapter
]

{ #category : #adding }
GridPresenter >> add: anAssociation [ 
	
	self 
		add: anAssociation key 
	 	constraints: anAssociation value
]

{ #category : #adding }
GridPresenter >> add: aPresenterOrSymbol constraints: aSpecGridConstraint [

	contents 
		at: aPresenterOrSymbol 
		put: aSpecGridConstraint
]

{ #category : #initialization }
GridPresenter >> initialize [ 

	super initialize.
	contents := OrderedDictionary new
]
