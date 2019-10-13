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
		with: self presenter presenters
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
	| rowIndex |

	self hasWidget ifFalse: [ ^ self ].

	rowIndex := self presenter selection selectedIndex.
	self 
		disconnectSelectionEventsOf: self innerWidget 
		during: [ 		
			self innerWidget unselectAll.
			(self rowAt: rowIndex)
				ifNotNil: [ :row | self innerWidget selectRow: row ] ]
]

{ #category : #private }
GtkComponentListAdapter >> rowAt: rowIndex [
	
	rowIndex ifNil: [ ^ nil ].
	^ self innerWidget children
		at: rowIndex
		ifAbsent: [ nil ]
]

{ #category : #accessing }
GtkComponentListAdapter >> selectedIndexes [
	| selectedRow |

	selectedRow := self innerWidget selectedRow.
	^ selectedRow ifNotNil: [ 
		{ self innerWidget children indexOf: selectedRow } ]
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
