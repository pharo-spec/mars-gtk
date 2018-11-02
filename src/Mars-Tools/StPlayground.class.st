Class {
	#name : #StPlayground,
	#superclass : #StPresenter,
	#instVars : [
		'text'
	],
	#category : #'Mars-Tools'
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

{ #category : #'as yet unclassified' }
StPlayground >> newBindingsToolBarItem [
		
	^ ToolBarButton new
		label: 'Bindings';
		icon: (self iconNamed: #glamorousTable);
		help: 'Edit bindings list';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #'as yet unclassified' }
StPlayground >> newGoToolBarItem [
		
	^ ToolBarButton new
		label: 'Do it';
		icon: (self iconNamed: #glamorousGo);
		help: 'Do it all and inspect';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #'as yet unclassified' }
StPlayground >> newHelpToolBarItem [
		
	^ ToolBarButton new
		label: 'Help';
		icon: (self iconNamed: #glamorousHelp);
		help: 'Open help browser';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #'as yet unclassified' }
StPlayground >> newMenu [
	| menuSpec |
	
	menuSpec := (PragmaMenuBuilder 
		pragmaKeyword: WorldState discoveredMenuPragmaKeyword 
		model: self)
		menuSpec.
	^ menuSpec asMenuBarPresenter
	
]

{ #category : #'as yet unclassified' }
StPlayground >> newPagesToolBarItem [
		
	^ ToolBarButton new
		label: 'Pages';
		icon: (self iconNamed: #glamorousMore);
		help: 'Load a saved page';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #'as yet unclassified' }
StPlayground >> newRemotePublishToolBarItem [
		
	^ ToolBarButton new
		label: 'Publish';
		icon: (self iconNamed: #glamorousSaveToUrl);
		help: 'Publish contents to the cloud';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #'as yet unclassified' }
StPlayground >> newSettingsToolBarItem [
		
	^ ToolBarButton new
		label: 'Settings';
		icon: (self iconNamed: #smallCogInitialState);
		help: 'Open settings browser';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #'as yet unclassified' }
StPlayground >> newToolBar [

	^ ToolBarPresenter new 
		addItem: self newUpdateToolBarItem position: ITItemPosition right;
		addItem: self newHelpToolBarItem  position: ITItemPosition right;
		addItem: self newSettingsToolBarItem position: ITItemPosition right;
		addItem: self newGoToolBarItem;
		addItem: self newRemotePublishToolBarItem;
		addItem: self newBindingsToolBarItem;
		addItem: self newPagesToolBarItem;
		yourself
]

{ #category : #'as yet unclassified' }
StPlayground >> newUpdateToolBarItem [
		
	^ ToolBarButton new
		label: 'Update';
		icon: (self iconNamed: #glamorousRefresh);
		help: 'Update inspect values';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #api }
StPlayground >> prepareWindow: aWindowPresenter [

	aWindowPresenter 
		menu: self newMenu;
		toolBar: self newToolBar";
		statusBar: self newStatusBar".
]

{ #category : #'accessing ui' }
StPlayground >> text [
	^ text
]

{ #category : #'accessing ui' }
StPlayground >> text: anObject [
	text := anObject
]
