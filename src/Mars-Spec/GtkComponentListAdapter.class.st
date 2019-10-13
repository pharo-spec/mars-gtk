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

	self presenter whenPresentersChangedDo: [ :collection | 
		self updateWith: collection ].	
			
	self
		update: gtkListBox 
		with: self presenter presenters.
		
	self presenter selection isEmpty ifFalse: [ 
		self refreshWidgetSelectionOf: gtkListBox ]
]

{ #category : #private }
GtkComponentListAdapter >> disconnectSelectionEventsOf: aWidget during: aBlock [

	aWidget 
		disconnect: 'selected-rows-changed' 
		during: aBlock
]

{ #category : #'private accessing' }
GtkComponentListAdapter >> innerWidget [

	^ widget child
]

{ #category : #testing }
GtkComponentListAdapter >> items [

	^ innerWidget items
]

{ #category : #factory }
GtkComponentListAdapter >> refreshWidgetSelection [

	self hasWidget ifFalse: [ ^ self ].
	self refreshWidgetSelectionOf: self innerWidget
]

{ #category : #private }
GtkComponentListAdapter >> refreshWidgetSelectionOf: gtkListBox [

	self 
		disconnectSelectionEventsOf: gtkListBox 
		during: [
			self presenter selection selectedIndexes do: [ :rowIndex |
				(gtkListBox children at: rowIndex ifAbsent: [ nil ]) 
					ifNotNil: [ :row | gtkListBox selectRow: row ] ] ]
]

{ #category : #accessing }
GtkComponentListAdapter >> selectedIndexes [
	| selectedRow |

	selectedRow := self innerWidget selectedRow.
	^ selectedRow 
		ifNotNil: [ { self innerWidget children indexOf: selectedRow } ]
		ifNil: [ #() ]
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
