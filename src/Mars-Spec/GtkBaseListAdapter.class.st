Class {
	#name : #GtkBaseListAdapter,
	#superclass : #GtkAbstractListAdapter,
	#traits : 'GtkTHaveWrappingScrollBars',
	#classTraits : 'GtkTHaveWrappingScrollBars classTrait',
	#category : #'Mars-Spec-Adapter-List'
}

{ #category : #building }
GtkBaseListAdapter >> addModelTo: gtkList [

	super addModelTo: gtkList.
	gtkList activateOnSingleClick: self presenter activatesOnSingleClick.
	self addSearchTo: gtkList.
	self presenter contextMenu ifNotNil: [ :menu |
		self addMenu: menu to: gtkList ].
]

{ #category : #building }
GtkBaseListAdapter >> addSearchTo: gtkList [
	
	self presenter isSearchEnabled ifFalse: [ ^ self ].
	
	gtkList enableSearch: true.
	gtkList hasCustomSearch ifTrue: [   
		gtkList searchFunction: [ :key :column :iter |
			self presenter 
				performSearch: (self presenter itemAtPath: iter toPathArray)
				matching: key ] ]
]

{ #category : #testing }
GtkBaseListAdapter >> columns [
	
	^ innerWidget columns
]

{ #category : #testing }
GtkBaseListAdapter >> isNonEditableRow: aRow column: aColumn [
	
	^ (innerWidget columns at: aColumn) isEditable not
]

{ #category : #'widget API' }
GtkBaseListAdapter >> refreshWidgetList [

	self refreshList
]

{ #category : #testing }
GtkBaseListAdapter >> selectedIndexes [
	^ innerWidget selection allSelected collect: #first as: Array
]

{ #category : #testing }
GtkBaseListAdapter >> selection [
	
	^ innerWidget selection
]

{ #category : #emulating }
GtkBaseListAdapter >> type: aString [
	"this will be used to test search"
	| entry |

	GtkRunLoop defer: [ 
		entry := self innerWidget searchEntry ].
	entry isNull inspect
]

{ #category : #testing }
GtkBaseListAdapter >> unselectAll [
	
	innerWidget selection unselectAll
]
