Class {
	#name : #GtkWindowAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #accessing }
GtkWindowAdapter >> addModelIn: aWindow withSpecLayout: aSpec [

	self flag: #todo. "'self model model'? how ugly"
	aWindow add: (self model model buildWithSpecLayout: aSpec)
]

{ #category : #building }
GtkWindowAdapter >> buildWidget [

	^ GtkWindow new
	
]
