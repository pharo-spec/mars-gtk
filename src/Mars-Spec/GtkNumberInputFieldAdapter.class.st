Class {
	#name : #GtkNumberInputFieldAdapter,
	#superclass : #GtkTextInputFieldAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkNumberInputFieldAdapter >> addModelTo: gtkSpinButton [

	super addModelTo: gtkSpinButton.
	gtkSpinButton beNumber.
	self model isFloat ifTrue: [ 
		gtkSpinButton digits: self model digits ].
	(self model maximum notNil 
		or: [ self model minimum notNil ])
		ifTrue: [ 
			gtkSpinButton 
				rangeMinimum: (self model minimum ifNil: [ 0.0 ]) 
				maximum: (self model maximum ifNil: [ 0.0 ]) ].
	self model climbRate ifNotNil: [ 
		gtkSpinButton climbRate: self model climbRate ]
]

{ #category : #building }
GtkNumberInputFieldAdapter >> gtkWidgetClass [ 

	^ GtkSpinButton
]
