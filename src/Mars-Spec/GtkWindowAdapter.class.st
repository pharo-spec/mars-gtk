Class {
	#name : #GtkWindowAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #building }
GtkWindowAdapter >> addMenuTo: aGtkWindow [

	
]

{ #category : #accessing }
GtkWindowAdapter >> addModelIn: aWindow withSpecLayout: aSpec [
	| contentWidget |
	self flag: #todo.	"'self model model'? can this be uglier?"
	contentWidget := self model presenter buildWithSpecLayout: aSpec.
	aWindow add: contentWidget
]

{ #category : #building }
GtkWindowAdapter >> addStatusbarTo: aGtkWindow [
	
]

{ #category : #building }
GtkWindowAdapter >> addToolbarTo: aGtkWindow [
]

{ #category : #building }
GtkWindowAdapter >> buildWidget [
	| gtkWindow |

	gtkWindow := GtkWindow new 
		autoRelease
		resize: self model initialExtent;
		yourself.
		
	self model hasMenu ifTrue: [ self addMenuTo: gtkWindow ].
	self model hasToolbar ifTrue: [ self addToolbarTo: gtkWindow ].
	self model hasStatusbar ifTrue: [ self addStatusbarTo: gtkWindow ].
		
	^ gtkWindow
]

{ #category : #'as yet unclassified' }
GtkWindowAdapter >> open [

	self model window showAll
]

{ #category : #'as yet unclassified' }
GtkWindowAdapter >> title: aString [ 

	^ self widgetDo: [ :this | this title: aString ]
]
