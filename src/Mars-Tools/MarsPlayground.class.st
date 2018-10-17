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
MarsPlayground >> newFileMenu [

	^ MenuPresenter new
		addGroup: [ :group | 
			group 
				addItem: [ :item | item name: 'Settings'; icon: (self iconNamed: #configuration) ];
				addItem: [ :item | 
					item 
						name: 'Save'; 
						icon: (self iconNamed: #smallSave); 
						shortcut: $s shift meta ];
				addItem: [ :item | item name: 'Save as...'; icon: (self iconNamed: #smallSaveAs) ];
				addItem: [ :item | item name: 'Save and quit'; icon: (self iconNamed: #smallQuit) ];
				addItem: [ :item | item name: 'Quit'; icon: (self iconNamed: #smallQuit) ] ].
		
]

{ #category : #'as yet unclassified' }
MarsPlayground >> newMenu [
	
	^ MenuBarPresenter new 
		addGroup: [ :group | 
			group 
				addItem: [ :item | item name: 'File'; subMenu: self newFileMenu ]";
				addItem: [ :item | item name: 'Tools'; subMenu: self newToolsMenu ]" ]
]

{ #category : #'as yet unclassified' }
MarsPlayground >> newToolsMenu [

	^ MenuPresenter new
		addGroup: [ :group | 
			group 
				addItem: [ :item | item name: 'Settings'; icon: (self iconNamed: #configuration) ];
				addItem: [ :item | item name: 'Save'; icon: (self iconNamed: #smallSave) ];
				addItem: [ :item | item name: 'Save as...'; icon: (self iconNamed: #smallSaveAs) ];
				addItem: [ :item | item name: 'Save and quit'; icon: (self iconNamed: #smallQuit) ];
				addItem: [ :item | item name: 'Quit'; icon: (self iconNamed: #smallQuit) ] ].
		
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
