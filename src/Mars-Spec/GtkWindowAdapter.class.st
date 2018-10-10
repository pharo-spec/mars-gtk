Class {
	#name : #GtkWindowAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #accessing }
GtkWindowAdapter >> addModelIn: aWindow withSpecLayout: aSpec [
	| contentWidget |
	
	self flag: #todo. "'self model model'? can this be uglier?"
	contentWidget := self model model buildWithSpecLayout: aSpec.
	aWindow add: contentWidget
]

{ #category : #building }
GtkWindowAdapter >> buildWidget [

	^ GtkWindow new autoRelease
]

{ #category : #'as yet unclassified' }
GtkWindowAdapter >> open [

	self model window showAll
]

{ #category : #'as yet unclassified' }
GtkWindowAdapter >> title: aString [ 

	^ self widgetDo: [ :this | this title: aString ]
]
