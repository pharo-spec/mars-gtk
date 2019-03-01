Class {
	#name : #GtkToggleButtonAdapter,
	#superclass : #GtkCheckBoxAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #factory }
GtkToggleButtonAdapter >> newWidget [

	^ GtkToggleButton buttonNew
]
