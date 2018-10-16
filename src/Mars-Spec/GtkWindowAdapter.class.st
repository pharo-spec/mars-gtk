Class {
	#name : #GtkWindowAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkWindowAdapter >> addMenuTo: gtkBox [
	| gtkMenuBar |
	
	gtkMenuBar := self model menu buildWithSpec.
	gtkBox 
		packStart: gtkMenuBar 
		expand: false 
		fill: false 
		padding: 0
]

{ #category : #accessing }
GtkWindowAdapter >> addModelIn: gtkWindow withSpecLayout: aSpec [
	| gtkBox contentWidget |
		
	gtkBox := GtkBox newVertical.
			
	self model hasMenu ifTrue: [ self addMenuTo: gtkBox ].
	self model hasToolBar ifTrue: [ self addToolBarTo: gtkBox ].
	
	contentWidget := self model presenter buildWithSpecLayout: aSpec.
	gtkBox packStart: contentWidget.

	self model hasStatusBar ifTrue: [ self addStatusBarTo: gtkBox ].
	
	gtkWindow add: gtkBox
]

{ #category : #building }
GtkWindowAdapter >> addStatusBarTo: gtkBox [
	| gtkStatusBar |
	
	gtkStatusBar := self model statusBar buildWithSpec.
	gtkBox 
		packStart: gtkStatusBar 
		expand: false 
		fill: false 
		padding: 0	
]

{ #category : #building }
GtkWindowAdapter >> addToolBarTo: gtkBox [
	| gtkToolBar |
	
	gtkToolBar := self model toolBar buildWithSpec.
	gtkBox 
		packStart: gtkToolBar 
		expand: false 
		fill: false 
		padding: 0
]

{ #category : #building }
GtkWindowAdapter >> buildWidget [

	^ GtkWindow new 
		autoRelease
		resize: self model initialExtent;
		yourself
]

{ #category : #'as yet unclassified' }
GtkWindowAdapter >> open [

	self model window showAll
]

{ #category : #'as yet unclassified' }
GtkWindowAdapter >> title: aString [ 

	^ self widgetDo: [ :this | this title: aString ]
]
