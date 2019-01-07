Class {
	#name : #GtkToolBarButtonAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #private }
GtkToolBarButtonAdapter >> addModelTo: gtkToolButton [
	
	gtkToolButton 
		tooltipText: self model help;
		connectClicked: self model action
]

{ #category : #building }
GtkToolBarButtonAdapter >> newWidget [
	
	^ GtkToolButton 
		newForm: self model icon 
		label: self model label
]
