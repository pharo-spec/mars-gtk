Class {
	#name : #GtkCheckBoxAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkCheckBoxAdapter >> addModelTo: gtkWidget [

	super addModelTo: gtkWidget.
	
	gtkWidget label: self presenter label.
	gtkWidget active: self presenter state.
	
	gtkWidget connectToggled: [ 
		self backendUpdatingDo: [ self presenter state: self state ] ].
	
	self presenter whenLabelChangedDo: [ self updateLabel ].
	self presenter whenChangedDo: [ self updateState ]
]

{ #category : #emulating }
GtkCheckBoxAdapter >> clicked [
	
	widget clicked
]

{ #category : #accessing }
GtkCheckBoxAdapter >> state [
	
	^ widget isActive
]

{ #category : #updating }
GtkCheckBoxAdapter >> updateLabel [

	self widgetDo: [ :w |
		w label: self presenter label ]
]

{ #category : #updating }
GtkCheckBoxAdapter >> updateState [

	self backendDetectCyclesDo: [
		self widgetDo: [ :w |
			w active: self presenter state ] ]
]

{ #category : #factory }
GtkCheckBoxAdapter >> widgetClass [

	^ GtkCheckButton
]
