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
		appendTextColumn;
		model: self newTreeStore.
	self model menu
		ifNotNil:
			[ :menuPresenter | gtkList contextMenu: menuPresenter buildWithSpec ].
	gtkList
		connectSelectionChanged: [ "allSelected -> array of paths. 
		 that's why first (path) and then first (selection)"
			self flag: #TODO.	"This will change in context of multiple selection"
			gtkList allSelected
				ifNotEmpty: [ :selectedPaths | self model selectIndex: selectedPaths first first ] ]
]

{ #category : #private }
GtkListAdapter >> modelItemsAsDisplay [
	^ self model model shownItems
		collect: [ :each | self model displayBlock value: each ]
]

{ #category : #private }
GtkListAdapter >> newTreeStore [

	^ GtkTreeStore newStrings: self modelItemsAsDisplay
]

{ #category : #private }
GtkListAdapter >> refreshList [
	
	self widgetDo: [ :w | w model: self newTreeStore ]
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
	(self widget selection allSelected collect: #first) asArray
		= rowIndexes
		ifTrue: [ ^ self ].
	self notYetImplemented.
	self flag:'Programatic selection of presenter in GTK'
]

{ #category : #updating }
GtkListAdapter >> update: aSymbol [
	"Spec uses this to inform about a change in the model"
	
	self flag: #TODO. "Review this inform mechanism (and see ways to avoid the coupling between
	spec and morphic)"
	aSymbol = #listElementAt: ifTrue: [ ^ self refreshList ].
	aSymbol = #getIndex ifTrue: [ ^ self refreshSelection ].

	^ super update: aSymbol	
]

{ #category : #building }
GtkListAdapter >> widgetClass [
	
	^ GtkTreeView
]
