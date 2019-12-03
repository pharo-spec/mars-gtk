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
		self backendUpdatingDo: [ self updatePresenterState ] ].
	self presenter whenChangedDo: [
		self backendDetectCyclesDo: [ self updateState ] ].
	
	self presenter whenLabelChangedDo: [ self updateLabel ]
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
GtkCheckBoxAdapter >> updatePresenterState [
	
	self presenter state: self state
]

{ #category : #updating }
GtkCheckBoxAdapter >> updateState [

	self widgetDo: [ :w | 
		self presenter state = w isActive
			ifFalse: [ w active: self presenter state ] ]
]

{ #category : #factory }
GtkCheckBoxAdapter >> widgetClass [

	^ GtkCheckButton
]
