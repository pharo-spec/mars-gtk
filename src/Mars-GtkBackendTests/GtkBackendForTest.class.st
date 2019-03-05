Class {
	#name : #GtkBackendForTest,
	#superclass : #AbstractBackendForTest,
	#instVars : [
		'app'
	],
	#category : #'Mars-GtkBackendTests'
}

{ #category : #accessing }
GtkBackendForTest >> assertHasHeader: aGtkTreeView [ 
	
	^ aGtkTreeView isHeadersVisible
]

{ #category : #asserting }
GtkBackendForTest >> assertIcon: aGtkImage equals: aForm [ 
	
	(aForm isNil and: [ aGtkImage isNil ]) ifTrue: [ ^ self ].
	
	"I can only test if the image is nil and the form is nil or not"
	self assert: (aForm isNotNil or: [(aGtkImage isNil or: [ aGtkImage isNull])]).
	self assert: (aGtkImage isNotNil and: [ aGtkImage isNull not])
	
]

{ #category : #'as yet unclassified' }
GtkBackendForTest >> assertImage: aGtkImage equals: aForm [ 
	
	| pixbuf |
	pixbuf := aGtkImage asGdkPixbuf.
	(aForm isNil and: [ pixbuf isNull ]) ifTrue: [ ^ self ].

	self assert: pixbuf isNull not.	
	self assert: pixbuf width = aForm width.
	self assert: pixbuf height = aForm height.
	self assert: pixbuf depth = aForm depth.

]

{ #category : #asserting }
GtkBackendForTest >> assertList: aGtkTreeView displayItems: aCollection [ 
	
	| iter |
	
	iter := aGtkTreeView model iteratorFromPath: (GtkTreePath newFromArray: {1}).

	aCollection do: [ :aValue |  
		self assert: (iter stringAt: 0) = aValue.
		iter next 
	].

]

{ #category : #asserting }
GtkBackendForTest >> assertListHeaderOf: aGtkTreeView equals: aCollection [

	self assert: (aGtkTreeView columns collect: [ :c | c title ]) asArray = aCollection asArray
	
]

{ #category : #testing }
GtkBackendForTest >> canChangeFonts [
	
	^ false
]

{ #category : #emulating }
GtkBackendForTest >> clickFirstRowAndColumn: aGtkTreeView [ 
	
	| path |
	path := (GtkTreePath newFromArray: {1}) autoRelease.	
	aGtkTreeView activateRow: path column: aGtkTreeView columns first
]

{ #category : #simulating }
GtkBackendForTest >> doubleClickFirstRowAndColumn: aGtkTreeView [ 
	
	self clickFirstRowAndColumn: aGtkTreeView
]

{ #category : #running }
GtkBackendForTest >> openInstanceOf: aTest [ 
		
	aTest window ifNil: [ 
		aTest presenter application: app.
		aTest window: aTest presenter openWithSpec ].

]

{ #category : #running }
GtkBackendForTest >> runTest: aBlockClosure [ 
		
	GtkApplication ensureRunning. 
	app := Application new.
	app useBackend: #Gtk. 
	
	aBlockClosure value.
	
	"SpecBindings value: GtkAdapterBindings during: aBlockClosure."

]
