Class {
	#name : #GtkNumberInputFieldAdapter,
	#superclass : #GtkTextInputFieldAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkNumberInputFieldAdapter >> addModelTo: gtkSpinButton [

	super addModelTo: gtkSpinButton.
	
	gtkSpinButton 
		beNumber;
		adjustment: GtkAdjustment newDefault;
		rangeMinimum: (self model minimum ifNil: [ Float fmin ]) 
			maximum: (self model maximum ifNil: [ Float fmax ]).
	
	self model isFloat ifTrue: [ 
		gtkSpinButton digits: self model digits ].
	self model climbRate ifNotNil: [ 
		gtkSpinButton climbRate: self model climbRate ]
]

{ #category : #private }
GtkNumberInputFieldAdapter >> refreshText [
	
	self widgetDo: [ :w |
		w value: self model number ]
]

{ #category : #building }
GtkNumberInputFieldAdapter >> widgetClass [ 

	^ GtkSpinButton
]
