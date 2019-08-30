Class {
	#name : #GClass,
	#superclass : #Object,
	#instVars : [
		'gType',
		'parentClass'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #'instance creation' }
GClass class >> newGType: aType parent: aGtkClass [

	^ self basicNew 
		initializeGType: aType parent: aGtkClass;
		yourself
]

{ #category : #accessing }
GClass >> gType [
	^ gType
]

{ #category : #initialization }
GClass >> initializeGType: aType parent: aGtkClass [

	self initialize.
	gType := aType.
	parentClass := aGtkClass
]

{ #category : #accessing }
GClass >> parent [

	^ parentClass
]
