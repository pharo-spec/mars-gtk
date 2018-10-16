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
	self model hasToolbar ifTrue: [ self addToolbarTo: gtkBox ].
	
	contentWidget := self model presenter buildWithSpecLayout: aSpec.
	gtkBox packStart: contentWidget.

	self model hasStatusbar ifTrue: [ self addStatusbarTo: gtkBox ].
	
	gtkWindow add: gtkBox
]

{ #category : #building }
GtkWindowAdapter >> addStatusbarTo: aBox [
	
]

{ #category : #building }
GtkWindowAdapter >> addToolbarTo: aBox [
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
