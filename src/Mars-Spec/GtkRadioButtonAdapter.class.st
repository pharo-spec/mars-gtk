Class {
	#name : #GtkRadioButtonAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #emulating }
GtkRadioButtonAdapter >> addModelTo: gtkWidget [
	
	super addModelTo: gtkWidget.

	self model associatedRadioButtons do: [ :e |  
		e withWidgetDo: [ :w | gtkWidget joinGroupOf: w widget ] ].
	
	gtkWidget label: self model label.
	gtkWidget active: self model state.
	
	gtkWidget connectToggled: [ self model state: self state ].
	
	self model whenLabelChangedDo: [ gtkWidget label: self model label ].
	self model whenChangedDo: [ gtkWidget active: self model state ].
		

]

{ #category : #emulating }
GtkRadioButtonAdapter >> clicked [
	
	widget clicked
]

{ #category : #accessing }
GtkRadioButtonAdapter >> state [
	
	^ widget isActive
]

{ #category : #factory }
GtkRadioButtonAdapter >> widgetClass [

	^ GtkRadioButton
]
