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
	gtkList enableSearch: self presenter isSearchEnabled.
	self presenter contextMenu ifNotNil: [ :menu |
		self addMenu: menu to: gtkList ].
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
