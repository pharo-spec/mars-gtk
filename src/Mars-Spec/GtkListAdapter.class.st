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

	super addModelTo: gtkList.

	self model selection isMultipleSelection 
		ifTrue: [gtkList beMultipleSelectionMode] 
		ifFalse: [gtkList beSingleSelectionMode].

	gtkList
		headersVisible: false;
		appendTextColumn;
		model: self newTreeStore.

	gtkList selection unselectAll.
	
	self presenter selection isEmpty 
		ifFalse: [ self presenter selection selectedIndexes 
				do: [ :anIndex | gtkList selection selectPath: { anIndex } ]  ].
	
	self presenter selection whenChangedDo: [ self presenter selection selectedIndexes 
				do: [ :anIndex | gtkList selection selectPath: { anIndex } ]].
	
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
