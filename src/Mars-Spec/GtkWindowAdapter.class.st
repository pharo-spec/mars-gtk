Class {
	#name : #GtkWindowAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkWindowAdapter >> addMenuTo: aGtkWindow [

	
]

{ #category : #accessing }
GtkWindowAdapter >> addModelIn: gtkWindow withSpecLayout: aSpec [
	| contentWidget |
		
		
	self model hasMenu ifTrue: [ self addMenuTo: gtkWindow ].
	self model hasToolbar ifTrue: [ self addToolbarTo: gtkWindow ].
	
	contentWidget := self model presenter buildWithSpecLayout: aSpec.
	gtkWindow add: contentWidget.

	self model hasStatusbar ifTrue: [ self addStatusbarTo: gtkWindow ]
]

{ #category : #building }
GtkWindowAdapter >> addStatusbarTo: aGtkWindow [
	
]

{ #category : #building }
GtkWindowAdapter >> addToolbarTo: aGtkWindow [
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
