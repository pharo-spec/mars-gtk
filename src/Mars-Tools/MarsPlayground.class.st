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
				addItem: [ :item | item name: 'Save'; icon: (self iconNamed: #smallSave) ];
				addItem: [ :item | item name: 'Save as...'; icon: (self iconNamed: #smallSaveAs) ];
				addItem: [ :item | item name: 'Save and quit'; icon: (self iconNamed: #smallQuit) ];
				addItem: [ :item | item name: 'Quit'; icon: (self iconNamed: #smallQuit) ] ].
		
]

{ #category : #'as yet unclassified' }
MarsPlayground >> newMenu [
	
	^ MenuPresenter new
		addGroup: [ :group | 
			group addItem: [ :item | item name: 'File'; subMenu: self newFileMenu ] ].

]

{ #category : #api }
MarsPlayground >> prepareWindow: aWindowPresenter [

	aWindowPresenter 
		menu: self newMenu";
		toolbar: self newToolbar;
		statusbar: self newStatusbar".
]

{ #category : #'accessing ui' }
MarsPlayground >> text [
	^ text
]

{ #category : #'accessing ui' }
MarsPlayground >> text: anObject [
	text := anObject
]
