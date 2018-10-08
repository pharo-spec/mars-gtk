Class {
	#name : #MarsSystemBrowserPresenter,
	#superclass : #MarsPresenter,
	#instVars : [
		'window'
	],
	#category : #'Mars-IDE'
}

{ #category : #building }
MarsSystemBrowserPresenter >> buildClassMethodPane [
		
	"^ GtkListBox new"
	^ GtkLabel newLabel: 'Class method pane'
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildClassPane [
		
	"^ GtkListBox new"
	^ GtkLabel newLabel: 'Class pane'	
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildClassProtocolPane [
		
	"^ GtkListBox new"
	^ GtkLabel newLabel: 'Class protocol pane'
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildClassSideMethodPane [
	
	^ GtkPaned newHorizontal 
		pack1: self buildClassProtocolPane;
		pack2: self buildClassMethodPane;
		yourself
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildCodePane [

	"^ GtkNotebook new"
	^ GtkLabel newLabel: 'Code pane'
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildContents [
	
	
	^ GtkPaned newVertical
		pack1: self buildPanes;
		pack2: self buildCodePane;
		yourself
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildInstanceMethodPane [
		
	"^ GtkListBox new"
	^ GtkLabel newLabel: 'Instance method pane'
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildInstanceProtocolPane [
		
	"^ GtkListBox new"
	^ GtkLabel newLabel: 'Instance protocol pane'	
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildInstanceSideMethodPane [
	
	^ GtkPaned newHorizontal
		pack1: self buildInstanceProtocolPane;
		pack2: self buildInstanceMethodPane;
		yourself
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildMethodPane [
		
	^ GtkNotebook new
		append: self buildInstanceSideMethodPane label: (GtkLabel newLabel: 'Instance');
		append: self buildClassSideMethodPane label: (GtkLabel newLabel: 'Class');
		yourself		
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildPackagePane [
		
	"^ GtkListBox new"
	^ GtkLabel newLabel: 'Package pane'
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildPanes [
		
	^ GtkPaned newHorizontal 
		pack1: (GtkPaned newHorizontal
			pack1: self buildPackagePane;
			pack2: self buildClassPane);
		pack2: self buildMethodPane;
		yourself
]

{ #category : #building }
MarsSystemBrowserPresenter >> buildWindow [ 

	^ GtkWindow new
		title: self model title;
		resize: self initialExtent;
		add: self buildContents;
		yourself.
]

{ #category : #accessing }
MarsSystemBrowserPresenter >> initialExtent [

	^ 900@750
]

{ #category : #initialization }
MarsSystemBrowserPresenter >> initialize [ 
	
	super initialize.
	model := MarsSystemBrowserModel new
]

{ #category : #showing }
MarsSystemBrowserPresenter >> open [ 

	^ self window showAll
]

{ #category : #private }
MarsSystemBrowserPresenter >> window [

	^ window ifNil: [ window := self buildWindow ]
]
