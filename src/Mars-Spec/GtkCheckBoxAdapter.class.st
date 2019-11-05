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
	
	self presenter whenLabelChangedDo: [ gtkWidget label: self presenter label ].
	self presenter whenChangedDo: [ 
		self backendDetectCyclesDo: [
			Stdio stdout print: gtkWidget; crlf. 
			(self presenter state == gtkWidget isActive) ifFalse: [ 
				gtkWidget active: self presenter state ] ] ]
]

{ #category : #emulating }
GtkCheckBoxAdapter >> clicked [
	
	widget clicked
]

{ #category : #accessing }
GtkCheckBoxAdapter >> state [
	
	^ widget getActive
]

{ #category : #factory }
GtkCheckBoxAdapter >> widgetClass [

	^ GtkCheckButton
]
