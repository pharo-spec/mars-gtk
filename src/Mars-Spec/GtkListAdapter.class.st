Class {
	#name : #GtkListAdapter,
	#superclass : #GtkBaseListAdapter,
	#category : #'Mars-Spec-Adapter-List'
}

{ #category : #specs }
GtkListAdapter class >> adaptingAliases [

	^ #(FastTableAdapter)
]

{ #category : #building }
GtkListAdapter >> addModelTo: gtkList [

	super addModelTo: gtkList.

	self model selection isMultipleSelection 
		ifTrue: [ gtkList beMultipleSelectionMode ]
		ifFalse: [ gtkList beSingleSelectionMode ].

	gtkList
		headersVisible: false;
		appendTextColumn;
		model: self newTreeStore.

	gtkList selection unselectAll.

	self presenter selection isEmpty 
		ifFalse: [ 
			self presenter selection selectedIndexes 
				do: [ :anIndex | gtkList selection selectPath: { anIndex } ]  ].
	
	self presenter selection whenChangedDo: [ 
		self presenter selection selectedIndexes 
			do: [ :anIndex | gtkList selection selectPath: { anIndex } ] ].
	
	gtkList connectRowActivated: [ :path | 
		self model doActivateAtIndex: path toArray first ].
	
	widget := gtkList.

	gtkList connectSelectionChanged: [ 
		self presenter selection selectIndexes: gtkList allSelected flattened ].
	
	self refreshWidgetHeaderTitleTo: gtkList
]

{ #category : #testing }
GtkListAdapter >> isShowColumnHeaders [
	
	^ self innerWidget isHeadersVisible
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

{ #category : #events }
GtkListAdapter >> refreshWidgetHeaderTitle [
	
	self refreshWidgetHeaderTitleTo: self innerWidget
]

{ #category : #events }
GtkListAdapter >> refreshWidgetHeaderTitleTo: gtkTreeView [
	
	self model headerTitle ifNotNil: [
		(gtkTreeView columns at: 1) title: self model headerTitle ].
	gtkTreeView headersVisible: self model headerTitle isNotNil
]
