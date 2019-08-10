Class {
	#name : #GtkBaseListAdapter,
	#superclass : #GtkAbstractListAdapter,
	#traits : 'TGtkHaveWrappingScrollBars',
	#classTraits : 'TGtkHaveWrappingScrollBars classTrait',
	#category : #'Mars-Spec-Adapter-List'
}

{ #category : #building }
GtkBaseListAdapter >> addModelTo: gtkList [

	super addModelTo: gtkList.
	self model contextMenu ifNotNil: [ :menu |
		self addMenu: menu to: gtkList ]
]

{ #category : #testing }
GtkBaseListAdapter >> columns [
	
	^ innerWidget columns
]

{ #category : #testing }
GtkBaseListAdapter >> isNonEditableRow: aRow column: aColumn [
	
	^ (innerWidget columns at: aColumn) isEditable not
]

{ #category : #testing }
GtkBaseListAdapter >> selectedIndexes [
	^ innerWidget selection allSelected collect: #first as: Array
]

{ #category : #testing }
GtkBaseListAdapter >> selection [
	
	^ innerWidget selection
]

{ #category : #testing }
GtkBaseListAdapter >> unselectAll [
	
	innerWidget selection unselectAll
]
