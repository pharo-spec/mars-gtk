Class {
	#name : #GtkToolbarButtonAdapter,
	#superclass : #GtkToolbarBaseButtonAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkToolbarButtonAdapter >> addModelTo: gtkToolButton [
	
	super addModelTo: gtkToolButton.
	gtkToolButton connectClicked: self presenter action	
]

{ #category : #building }
GtkToolbarButtonAdapter >> newWidget [
	
	^ GtkToolButton 
		newForm: self presenter icon 
		label: self presenter label
]
