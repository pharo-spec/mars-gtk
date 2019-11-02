Class {
	#name : #GtkColumnedListAdapter,
	#superclass : #GtkBaseListAdapter,
	#traits : 'GtkTTableAccessing',
	#classTraits : 'GtkTTableAccessing classTrait',
	#category : #'Mars-Spec-Adapter-List'
}

{ #category : #building }
GtkColumnedListAdapter >> addModelTo: gtkList [
		
	super addModelTo: gtkList.

	gtkList
		headersVisible: self model isShowingColumnHeaders;
		beSingleSelectionMode.	
	self addColumnsTo: gtkList.
	gtkList model: self newTreeStore.
	self addSortableColumnsTo: gtkList.
	
	gtkList selection unselectAll.
	self presenter selection isEmpty ifFalse: [ 
		gtkList selection selectPath: self presenter selection selectedIndexes ].
	
	gtkList connectSelectionChanged: [ 
		self presenter selection selectIndexes: gtkList allSelected flattened ]
]

{ #category : #events }
GtkColumnedListAdapter >> refreshListOf: gtkWidget [

	super refreshListOf: gtkWidget.
	self addSortableColumnsTo: gtkWidget
]
