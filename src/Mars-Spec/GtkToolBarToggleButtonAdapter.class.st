Class {
	#name : #GtkToolBarToggleButtonAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkToolBarToggleButtonAdapter >> addModelTo: gtkToolButton [
	
	"Show all to ensure icons are shown if they are not"
	gtkToolButton showAll.
	gtkToolButton 
		tooltipText: self presenter help;
		connectToggled: [ self presenter execute: gtkToolButton active ]
]

{ #category : #building }
GtkToolBarToggleButtonAdapter >> newWidget [
	
	^ GtkToggleToolButton new 
		label: self presenter label;
		iconWidget: self presenter icon asGtkImage;
		yourself
]
