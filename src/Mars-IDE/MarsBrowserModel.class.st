Class {
	#name : #MarsBrowserModel,
	#superclass : #Object,
	#instVars : [
		'title',
		'window'
	],
	#category : #'Mars-IDE'
}

{ #category : #building }
MarsBrowserModel >> buildClassPane [
		
	^ GtkListBox new
]

{ #category : #building }
MarsBrowserModel >> buildCodePane [

	^ GtkNotebook new
]

{ #category : #building }
MarsBrowserModel >> buildContents [
	
	
	^ GtkPaned newHorizontal
		pack1: self buildPanes;
		pack2: self buildCodePane;
		yourself
]

{ #category : #building }
MarsBrowserModel >> buildMethodPane [
		
	^ GtkListBox new
]

{ #category : #building }
MarsBrowserModel >> buildPackagePane [
		
	^ GtkListBox new
]

{ #category : #building }
MarsBrowserModel >> buildPanes [
		
	^ GtkPaned newVertical 
		pack1: (GtkPaned newVertical
			pack1: self buildPackagePane;
			pack2: self buildClassPane);
		pack2: self buildMethodPane;
		yourself
]

{ #category : #building }
MarsBrowserModel >> buildWindow [ 

	^ GtkWindow new
		title: self title;
		resize: self initialExtent;
		add: self buildContents;
		yourself.
]

{ #category : #accessing }
MarsBrowserModel >> initialExtent [

	^ 900@750
]

{ #category : #showing }
MarsBrowserModel >> open [ 

	^ self window showAll
]

{ #category : #accessing }
MarsBrowserModel >> title [ 
	
	^ title ifNil: [ 'Untitled' ]
]

{ #category : #private }
MarsBrowserModel >> window [

	^ window ifNil: [ window := self buildWindow ]
]
