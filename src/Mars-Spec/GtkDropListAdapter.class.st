Class {
	#name : #GtkDropListAdapter,
	#superclass : #GtkAbstractListAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkDropListAdapter >> addModelTo: gtkComboBox [
	
	super addModelTo: gtkComboBox.
	
	gtkComboBox model: self newTreeStore.
	gtkComboBox activeIndex: self model selectedIndex - 1.
	gtkComboBox connectChanged: [ 
		self widgetDo: [ :w | 
			self model selectedIndex: w activeIndex + 1 ] ].
	
	self model whenSelectionChanged:  [ gtkComboBox activeIndex: self model selectedIndex - 1  ].
	self model model whenChangedDo: [ 	
		gtkComboBox model: self newTreeStore.
		gtkComboBox activeIndex: self model selectedIndex - 1]
]

{ #category : #building }
GtkDropListAdapter >> modelItemsAsDisplay [
	
	^ self model model shownItems collect: [ :each | self model displayForItem: each]
	
]

{ #category : #accessing }
GtkDropListAdapter >> selectedIndexes [
	
	^ self widget selectedIndexes 
]

{ #category : #building }
GtkDropListAdapter >> takeKeyboardFocus [ 

	^ self doTakeKeyboardFocus
]

{ #category : #building }
GtkDropListAdapter >> widgetClass [
	
	^ GtkComboBoxText
]
