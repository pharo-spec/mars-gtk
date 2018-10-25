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

{ #category : #building }
GtkGenericAdapter >> buildWidget [

	^ GtkScrolledWindow newWidget: (GtkMorphView newMorph: self morph)
]

{ #category : #accessing }
GtkGenericAdapter >> morph [

	^ morph
]

{ #category : #accessing }
GtkGenericAdapter >> morph: anObject [

	morph := anObject
]
