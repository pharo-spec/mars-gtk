Class {
	#name : #GtkTreeDataColumn,
	#superclass : #Object,
	#instVars : [
		'evaluation',
		'store'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #'instance creation' }
GtkTreeDataColumn class >> evaluated: aBlock [ 

	^ self new evaluated: aBlock
]

{ #category : #accessing }
GtkTreeDataColumn >> evaluated: aValuable [

	evaluation := aValuable
]

{ #category : #accessing }
GtkTreeDataColumn >> gType [

	^ self subclassResponsibility
]

{ #category : #accessing }
GtkTreeDataColumn >> readObject: anObject [ 

	^ evaluation cull: anObject
]

{ #category : #initialization }
GtkTreeDataColumn >> setValueOf: item to: gValue [

	self subclassResponsibility
]

{ #category : #accessing }
GtkTreeDataColumn >> store [
	^ store
]

{ #category : #accessing }
GtkTreeDataColumn >> store: anObject [
	store := anObject
]
