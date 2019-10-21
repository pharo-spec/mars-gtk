Class {
	#name : #GtkComponentListAdapter,
	#superclass : #GtkAdapter,
	#traits : 'GtkTDisconnectSelectionEvents',
	#classTraits : 'GtkTDisconnectSelectionEvents classTrait',
	#instVars : [
		'innerWidget'
	],
	#classInstVars : [
		'gtkWidget',
		'realWidget'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #specs }
GtkComponentListAdapter class >> adaptingAliases [

	^ #(FastTableAdapter)
]

{ #category : #building }
GtkComponentListAdapter >> addModelTo: gtkListBox [

	self model selection isMultipleSelection 
		ifTrue: [ gtkListBox beMultipleSelectionMode ]
		ifFalse: [ gtkListBox beSingleSelectionMode ].

	self presenter whenPresentersChangedDo: [ :collection | 
		self updateWith: collection ].	
			
	self
		update: gtkListBox 
		with: self presenter presenters.
		
	self presenter selection isEmpty ifFalse: [ 
		self refreshWidgetSelectionOf: gtkListBox ].
	
	gtkListBox connectSelectedRowsChanged: [ 
		self backendUpdatingDo: [  
			self presenter selection selectIndexes: self innerWidget selectedIndexes ] ]
]

{ #category : #private }
GtkComponentListAdapter >> disconnectSelectionEventsOf: aWidget during: aBlock [

	aWidget 
		disconnectAll: #('row-selected' 'selected-rows-changed')
		during: aBlock
]

{ #category : #'private accessing' }
GtkComponentListAdapter >> innerWidget [

	^ widget child
]

{ #category : #testing }
GtkComponentListAdapter >> isNonEditableRow: aRow column: aColumn [ 
	"no rows are directly editable in a component list (they can be 
	 if defined like that in the inner presenters, but it is handled different)"
	^ true
]

{ #category : #testing }
GtkComponentListAdapter >> items [

	^ innerWidget items
]

{ #category : #updating }
GtkComponentListAdapter >> refreshList [
	
	self innerWidgetDo: [ :w |
		self 
			disconnectSelectionEventsOf: w
			during: [ self update: w with: self presenter items ] ]
]

{ #category : #factory }
GtkComponentListAdapter >> refreshWidgetSelection [

	self hasWidget ifFalse: [ ^ self ].
	self refreshWidgetSelectionOf: self innerWidget
]

{ #category : #private }
GtkComponentListAdapter >> refreshWidgetSelectionOf: gtkListBox [

	self 
		refreshWidgetSelectionOf: gtkListBox 
		indexes: self presenter selection selectedIndexes
]

{ #category : #private }
GtkComponentListAdapter >> refreshWidgetSelectionOf: gtkListBox indexes: aCollection [

	self 
		disconnectSelectionEventsOf: gtkListBox 
		during: [
			aCollection do: [ :rowIndex | 
				gtkListBox selectIndex: rowIndex ] ]
]

{ #category : #accessing }
GtkComponentListAdapter >> selectIndex: rowIndex [

	self innerWidgetDo: [ :w |
		rowIndex ~= 0 
			ifTrue: [ 
				w selectIndex: rowIndex.
				self flag: #TODO. "Not implemented directly in listbox, I need to do it by hand"
				"self scrollToSelectionIfNeeded: rowIndex" ]
			ifFalse: [ 
				w unselectAll ] ]
]

{ #category : #accessing }
GtkComponentListAdapter >> selectedIndexes [

	^ self innerWidget selectedIndexes
]

{ #category : #building }
GtkComponentListAdapter >> update: gtkWidget with: aCollection [
	| listItem |
	
	gtkWidget removeAll.
	aCollection doWithIndex: [ :presenter :index | 
		listItem := presenter buildWithSpec asListBoxRow.
		gtkWidget add: listItem ].
	gtkWidget showAll
]

{ #category : #building }
GtkComponentListAdapter >> updateWith: aCollection [

	self 
		update: self innerWidget 
		with: aCollection
]

{ #category : #building }
GtkComponentListAdapter >> widgetClass [
	
	^ GtkListBox
]

{ #category : #building }
GtkComponentListAdapter >> wrapWidget: gtkWidget [

	innerWidget := gtkWidget.
	^ self wrapWithScrollableWindow: gtkWidget
		
]
