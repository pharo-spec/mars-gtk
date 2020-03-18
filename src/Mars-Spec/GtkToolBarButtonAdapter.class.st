Class {
	#name : #GtkToolBarButtonAdapter,
	#superclass : #GtkToolBarBaseButtonAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkToolBarButtonAdapter >> addModelTo: gtkToolButton [
	
	super addModelTo: gtkToolButton.
	gtkToolButton connectClicked: self presenter action	
]

{ #category : #building }
GtkToolBarButtonAdapter >> newWidget [
	
	^ GtkToolButton 
		newForm: self presenter icon 
		label: self presenter label
]
