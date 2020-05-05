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
	| button  |
	
	button := GtkToggleToolButton new 
		label: self presenter label;
		yourself.
		
	self presenter icon ifNotNil: [ :icon | 
		button iconWidget: icon asGtkImage ].

	^ button 
]
