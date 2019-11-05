Class {
	#name : #GtkCheckBoxAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #emulating }
GtkCheckBoxAdapter >> addModelTo: gtkWidget [
	
	super addModelTo: gtkWidget.
	
	gtkWidget label: self model label.
	gtkWidget active: self model state.
	
	gtkWidget connectToggled: [ 
		self backendUpdatingDo: [ self model state: self state ] ].
	
	self model whenLabelChangedDo: [ gtkWidget label: self model label ].
	self model whenChangedDo: [ 
		self backendDetectCyclesDo: [ 
			self model state = gtkWidget isActive ifFalse: [ 
				gtkWidget active: self model state ] ] ]
]

{ #category : #emulating }
GtkCheckBoxAdapter >> clicked [
	
	widget clicked
]

{ #category : #factory }
GtkCheckBoxAdapter >> newWidget [

	^ GtkCheckButton buttonNew
]

{ #category : #accessing }
GtkCheckBoxAdapter >> state [
	
	^ widget getActive
]
