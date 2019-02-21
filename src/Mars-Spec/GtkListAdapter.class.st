Class {
	#name : #GtkListAdapter,
	#superclass : #GtkAdapter,
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
	
	self presenter selection isEmpty ifFalse: [ gtkList selection selectPath: self presenter selection selectedIndexes ].
	
	self model menu
		ifNotNil:
			[ :menuPresenter | gtkList contextMenu: menuPresenter buildWithSpec ].
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

{ #category : #updating }
GtkListAdapter >> refreshList [

	self widgetDo: [ :w |
		w model: self newTreeStore ]
]

{ #category : #private }
GtkListAdapter >> refreshSelection [
	
	self widgetDo: [ :w |
		w selectPath: { self model selectedIndex } ]
]

{ #category : #'as yet unclassified' }
GtkListAdapter >> refreshWidgetSelection [
	| rowIndexes |
	
	rowIndexes := self presenter selection selectedIndexes.
	(self widget selection allSelected collect: #first) asArray = rowIndexes
		ifTrue: [ ^ self ].
		
	rowIndexes ifEmpty: [ ^ self widget selection unselectAll ].

	self widget 	selection selectPath: rowIndexes.

]

{ #category : #building }
GtkListAdapter >> widgetClass [
	
	^ GtkTreeView
]
