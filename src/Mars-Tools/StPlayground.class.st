Class {
	#name : #StPlayground,
	#superclass : #StPresenter,
	#instVars : [
		'text',
		'statusBar'
	],
	#category : #'Mars-Tools-Playground'
}

{ #category : #accessing }
StPlayground class >> defaultExtent [

	^ 600 @ 400
]

{ #category : #specs }
StPlayground class >> defaultSpec [

	^ SpecLayout composed
		newRow: #text
]

{ #category : #accessing }
StPlayground class >> defaultTitle [ 

	^ 'Playground'
]

{ #category : #api }
StPlayground >> initialExtent [ 

	^ self class defaultExtent
]

{ #category : #initialization }
StPlayground >> initialize [
	super initialize.
	self title: self class defaultTitle
]

{ #category : #initialization }
StPlayground >> initializeWidgets [
	
	text := self newText beForCode.
	self focusOrder add: text
]

{ #category : #initialization }
StPlayground >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		toolBar: self newToolBar;
		statusBar: (statusBar := self newStatusBar).
	
	self flag: #TODO. "This just has sense if this is the 'main' window"
	"aWindowPresenter menu: self newMenu"
]

{ #category : #'private factory' }
StPlayground >> newMenu [
	| menuSpec |
	
	menuSpec := (PragmaMenuBuilder 
		pragmaKeyword: WorldState discoveredMenuPragmaKeyword 
		model: self)
		menuSpec.
	^ menuSpec asMenuBarPresenter
	
]

{ #category : #'private factory' }
StPlayground >> newStatusBar [ 

	^ StatusBarPresenter new
]

{ #category : #'private factory' }
StPlayground >> newToolBar [

	^ LtToolBarBuilder new 
		owner: self;
		matching: [ :each | each hasGroup: StPlaygroundCommandGroup uniqueInstance ];
		build
]

{ #category : #'accessing ui' }
StPlayground >> text [
	^ text
]

{ #category : #'accessing ui' }
StPlayground >> text: anObject [
	text := anObject
]
