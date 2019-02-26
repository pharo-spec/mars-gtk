Class {
	#name : #GtkBackendForTest,
	#superclass : #AbstractBackendForTest,
	#category : #'Mars-GtkBackendTests'
}

{ #category : #asserting }
GtkBackendForTest >> assertIcon: aGtkImage equals: aForm [ 
	
	"I can only test if the image is nil and the form is nil or not"
	self assert: (aForm isNotNil or: [(aGtkImage isNil or: [ aGtkImage isNull])]).
	self assert: (aGtkImage isNotNil and: [ aGtkImage isNull not])
	
]

{ #category : #testing }
GtkBackendForTest >> canChangeFonts [
	
	^ false
]

{ #category : #testing }
GtkBackendForTest >> emulateClick: mouseButtonCode onTest: aButtonAdapterTest [ 

	MouseButtonEvent yellowButton = mouseButtonCode 
		ifTrue: [ aButtonAdapterTest adapter rightClicked ].

	MouseButtonEvent redButton = mouseButtonCode 
		ifTrue: [ aButtonAdapterTest adapter clicked ].

]

{ #category : #running }
GtkBackendForTest >> openInstanceOf: aTest [ 
	
	aTest window ifNil: [ aTest window: aTest presenter openWithSpec ].

]

{ #category : #running }
GtkBackendForTest >> runTest: aBlockClosure [ 
	
	GtkApplication ensureRunning. 
	SpecBindings value: GtkAdapterBindings during: aBlockClosure.
]
