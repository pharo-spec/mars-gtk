Class {
	#name : #GtkDropListAdapter,
	#superclass : #GtkListAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkDropListAdapter >> addModelTo: gtkComboBox [
	
	gtkComboBox model: self newTreeStore.
	gtkComboBox activeIndex: self model selectedIndex - 1.
	gtkComboBox connectChanged: [ 
		self widgetDo: [ :w | 
			self model setSelectedIndex: w activeIndex + 1 ] ]
]

{ #category : #building }
GtkDropListAdapter >> widgetClass [
	
	^ GtkComboBoxText
]
