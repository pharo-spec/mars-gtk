Class {
	#name : #GtkListAdapter,
	#superclass : #GtkAbstractListAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #specs }
GtkListAdapter class >> adaptingAliases [

	^ #(FastTableAdapter)
]

{ #category : #building }
GtkListAdapter >> addModelTo: gtkList [
	gtkList
		headersVisible: false;
		beSingleSelectionMode;
		appendTextColumn;
		model: self newTreeStore.

	gtkList selection unselectAll.
	
	self presenter selection isEmpty 
		ifFalse: [ gtkList selection selectPath: self presenter selection selectedIndexes ].
	
	gtkList
		connectSelectionChanged: [ 
			self presenter selection selectIndexes: gtkList allSelected flattened ]
]

{ #category : #private }
GtkListAdapter >> modelItemsAsDisplay [
	^ self model model shownItems 
		collect: [ :each | (self model displayBlock value: each) asString ]
]

{ #category : #private }
GtkListAdapter >> newTreeStore [

	^ GtkTreeStore newStrings: self modelItemsAsDisplay
]
