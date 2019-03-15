Class {
	#name : #GtkSimpleListModel,
	#superclass : #GListModel,
	#instVars : [
		'items'
	],
	#category : 'Mars-Gtk-Misc'
}

{ #category : #'instance creation' }
GtkSimpleListModel class >> newItems: aSequenceableCollection [
	^ self new items: aSequenceableCollection
]

{ #category : #private }
GtkSimpleListModel >> itemAt: position [
	^ GtkListBoxRow newWidget: (GtkLabel newLabel: (self items at: position))
]

{ #category : #accessing }
GtkSimpleListModel >> items [
	^ items
]

{ #category : #accessing }
GtkSimpleListModel >> items: anObject [
	items := anObject
]

{ #category : #private }
GtkSimpleListModel >> numberOfItems [
	^ self items size
]
