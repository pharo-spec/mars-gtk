Class {
	#name : #GtkAbstractListAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkAbstractListAdapter >> connectSelectionChanged [

	widget
		connectSelectionChanged: [ self presenter selection
				selectIndexes: widget allSelected flattened ]
]

{ #category : #private }
GtkAbstractListAdapter >> newTreeStore [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
GtkAbstractListAdapter >> refreshWidgetSelection [
	| rowIndexes |
	
	rowIndexes := self presenter selection selectedIndexes.
	(self widget selection allSelected collect: #first) asArray = rowIndexes
		ifTrue: [ ^ self ].
		
	rowIndexes ifEmpty: [ ^ self widget selection unselectAll ].

	self widget 	selection selectPath: rowIndexes.

]

{ #category : #building }
GtkAbstractListAdapter >> resetSelection [
	
	self widget selection unselectAll
]

{ #category : #accessing }
GtkAbstractListAdapter >> selectIndex: anInteger [ 
	
	anInteger = 0 ifTrue: [ widget selection unselectAll. ^ self ].
	widget selectIndex: anInteger
]

{ #category : #building }
GtkAbstractListAdapter >> takeKeyboardFocus [

	| needToCleanUP |
	
	needToCleanUP := self presenter selection isEmpty.

	needToCleanUP ifTrue: [ self widget selection disconnect: 'changed' ].

	self doTakeKeyboardFocus.

	self flag: #hack.
	"GTK has an issue when giving the focus to a List. When it gives the focus selects the first element"
	
	needToCleanUP ifTrue: [ 
		self widget selection unselectAll.
		self connectSelectionChanged.	 ]

]

{ #category : #building }
GtkAbstractListAdapter >> widgetClass [
	
	^ GtkTreeView
]
