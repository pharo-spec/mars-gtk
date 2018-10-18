Class {
	#name : #GtkToolBarButtonAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec'
}

{ #category : #private }
GtkToolBarButtonAdapter >> addModelTo: gtkToolButton [
	
	gtkToolButton 
		tooltipText: self model help;
		connectClicked: self model action
]

{ #category : #building }
GtkToolBarButtonAdapter >> buildWidget [
	| gtkToolButton |
	
	gtkToolButton := (GtkToolButton newForm: self model icon label: self model label).
	self addModelTo: gtkToolButton.
	^ gtkToolButton

]
