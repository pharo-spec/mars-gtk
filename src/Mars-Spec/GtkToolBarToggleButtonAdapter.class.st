Class {
	#name : #GtkToolBarToggleButtonAdapter,
	#superclass : #GtkToolBarBaseButtonAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkToolBarToggleButtonAdapter >> addModelTo: gtkToolButton [
	
	super addModelTo: gtkToolButton.

	gtkToolButton connectToggled: [ self presenter execute: gtkToolButton active ]
]

{ #category : #building }
GtkToolBarToggleButtonAdapter >> newWidget [
	
	^ GtkToggleToolButton new 
		label: self presenter label;
		iconWidget: self presenter icon asGtkImage;
		yourself
]
