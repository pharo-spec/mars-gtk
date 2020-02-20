Class {
	#name : #GtkRadioButtonAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #emulating }
GtkRadioButtonAdapter >> addAssociatedTo: gtkWidget [
	| current |
	
	self presenter associatedRadioButtons ifEmpty: [ ^ self ].
	current := gtkWidget.
	self presenter associatedRadioButtons do: [ :each |  
		each withWidgetDo: [ :w | 
			current joinGroupOf: w widget.
			current := w widget ] ].
	
	self presenter isInitialStateSet ifFalse: [ 
		GtkRadioButton new 
			joinGroupOf: gtkWidget;
			hide;
			active: true ]
]

{ #category : #emulating }
GtkRadioButtonAdapter >> addModelTo: gtkWidget [
	
	super addModelTo: gtkWidget.
	
	gtkWidget label: self getLabelText.
	gtkWidget active: self presenter state.
	self addAssociatedTo: gtkWidget.
	
	gtkWidget connectToggled: [ self presenter state: self state ].
	
	self model whenLabelChangedDo: [ gtkWidget label: self getLabelText ].
	self model whenChangedDo: [ gtkWidget active: self presenter state ]
]

{ #category : #emulating }
GtkRadioButtonAdapter >> clicked [
	
	widget clicked
]

{ #category : #updating }
GtkRadioButtonAdapter >> getLabelText [

	^ self presenter label ifNotNil: [ :aString | aString valueForPresenter: self presenter ]
]

{ #category : #accessing }
GtkRadioButtonAdapter >> state [
	
	^ widget isActive
]

{ #category : #factory }
GtkRadioButtonAdapter >> widgetClass [

	^ GtkRadioButton
]
