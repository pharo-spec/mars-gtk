Class {
	#name : #GtkToggleButtonAdapter,
	#superclass : #GtkCheckBoxAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkToggleButtonAdapter >> addModelTo: gtkToggleButton [

	super addModelTo: gtkToggleButton.
	
	self presenter icon ifNotNil: [ 
		self setIconTo: gtkToggleButton ].
	
	self presenter whenIconChangedDo: [ 
		self setIconTo: gtkToggleButton ].
	
]

{ #category : #building }
GtkToggleButtonAdapter >> setIconTo: gtkToggleButton [

	gtkToggleButton 
		alwaysShowImage: true;
		image: self presenter icon asGtkImage
]

{ #category : #factory }
GtkToggleButtonAdapter >> widgetClass [

	^ GtkToggleButton
]
