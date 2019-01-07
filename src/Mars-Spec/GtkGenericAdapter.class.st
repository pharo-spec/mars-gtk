Class {
	#name : #GtkGenericAdapter,
	#superclass : #GtkAdapter,
	#instVars : [
		'morph'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #'instance creation' }
GtkGenericAdapter class >> morph: aMorph [

	^ self new morph: aMorph
]

{ #category : #accessing }
GtkGenericAdapter >> morph [

	^ morph
]

{ #category : #accessing }
GtkGenericAdapter >> morph: anObject [

	morph := anObject
]

{ #category : #building }
GtkGenericAdapter >> newWidget [

	^ GtkScrolledWindow newWidget: (GtkMorphView newMorph: self morph)
]
