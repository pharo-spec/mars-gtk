Class {
	#name : #MarsPlayground,
	#superclass : #MarsPresenter,
	#instVars : [
		'text'
	],
	#category : #'Mars-Tools'
}

{ #category : #accessing }
MarsPlayground class >> defaultExtent [

	^ 600 @ 400
]

{ #category : #specs }
MarsPlayground class >> defaultSpec [

	^ SpecLayout composed
		newRow: #text
]

{ #category : #accessing }
MarsPlayground class >> defaultTitle [ 

	^ 'Playground'
]

{ #category : #api }
MarsPlayground >> initialExtent [ 

	^ self class defaultExtent
]

{ #category : #initialization }
MarsPlayground >> initialize [
	super initialize.
	self title: self class defaultTitle
]

{ #category : #initialization }
MarsPlayground >> initializeWidgets [
	
	text := self newText beForCode
]

{ #category : #'as yet unclassified' }
MarsPlayground >> newMenu [
	| menuSpec |
	
	menuSpec := (PragmaMenuBuilder 
		pragmaKeyword: WorldState discoveredMenuPragmaKeyword 
		model: self)
		menuSpec.
	^ menuSpec asMenuBarPresenter
	
]

{ #category : #api }
MarsPlayground >> prepareWindow: aWindowPresenter [

	aWindowPresenter 
		menu: self newMenu";
		toolBar: self newToolBar;
		statusBar: self newStatusBar".
]

{ #category : #'accessing ui' }
MarsPlayground >> text [
	^ text
]

{ #category : #'accessing ui' }
MarsPlayground >> text: anObject [
	text := anObject
]
