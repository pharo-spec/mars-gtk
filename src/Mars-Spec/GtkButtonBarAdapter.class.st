Class {
	#name : #GtkButtonBarAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkButtonBarAdapter >> addModelTo: gtkWidget [
	
	self model isPlaceAtStart ifTrue: [ gtkWidget placeAtStart ].
	self model isPlaceAtEnd ifTrue: [ gtkWidget placeAtEnd ].
	
	self model items do: [ :each |
		gtkWidget packStart: each buildWithSpec ]
]

{ #category : #building }
GtkButtonBarAdapter >> newWidget [ 

	^ GtkButtonBox newHorizontal
]
