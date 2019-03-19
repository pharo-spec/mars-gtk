Class {
	#name : #GtkToolBarButtonAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #private }
GtkToolBarButtonAdapter >> addModelTo: gtkToolButton [
	
	"Show all to ensure icons are shown if they are not"
	gtkToolButton showAll.
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
