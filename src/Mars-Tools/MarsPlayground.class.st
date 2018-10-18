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
	
	text := self newText beForCode.
	self focusOrder add: text
]

{ #category : #'as yet unclassified' }
MarsPlayground >> newBindingsToolBarItem [
		
	^ ToolBarButton new
		label: 'Bindings';
		icon: (self iconNamed: #glamorousTable);
		help: 'Edit bindings list';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #'as yet unclassified' }
MarsPlayground >> newGoToolBarItem [
		
	^ ToolBarButton new
		label: 'Do it';
		icon: (self iconNamed: #glamorousGo);
		help: 'Do it all and inspect';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #'as yet unclassified' }
MarsPlayground >> newHelpToolBarItem [
		
	^ ToolBarButton new
		label: 'Help';
		icon: (self iconNamed: #glamorousHelp);
		help: 'Open help browser';
		action: [ self inform: 'TODO!' ];
		yourself
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

{ #category : #'as yet unclassified' }
MarsPlayground >> newPagesToolBarItem [
		
	^ ToolBarButton new
		label: 'Pages';
		icon: (self iconNamed: #glamorousMore);
		help: 'Load a saved page';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #'as yet unclassified' }
MarsPlayground >> newRemotePublishToolBarItem [
		
	^ ToolBarButton new
		label: 'Publish';
		icon: (self iconNamed: #glamorousSaveToUrl);
		help: 'Publish contents to the cloud';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #'as yet unclassified' }
MarsPlayground >> newSettingsToolBarItem [
		
	^ ToolBarButton new
		label: 'Settings';
		icon: (self iconNamed: #smallCogInitialState);
		help: 'Open settings browser';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #'as yet unclassified' }
MarsPlayground >> newToolBar [

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
MarsPlayground >> newUpdateToolBarItem [
		
	^ ToolBarButton new
		label: 'Update';
		icon: (self iconNamed: #glamorousRefresh);
		help: 'Update inspect values';
		action: [ self inform: 'TODO!' ];
		yourself
]

{ #category : #api }
MarsPlayground >> prepareWindow: aWindowPresenter [

	aWindowPresenter 
		menu: self newMenu;
		toolBar: self newToolBar";
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
