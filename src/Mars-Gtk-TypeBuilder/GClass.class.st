Class {
	#name : #GClass,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #'instance creation' }
GClass class >> new [

	self error: 'Use #newType:'
]

{ #category : #'instance creation' }
GClass class >> newType: aType [

	^ self basicNew
		initializeType: aType;
		yourself
]

{ #category : #initialization }
GClass >> initializeType: aType [

	self initialize.
	type := aType
]
