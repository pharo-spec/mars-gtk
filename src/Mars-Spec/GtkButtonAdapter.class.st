Class {
	#name : #GtkButtonAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #factory }
GtkButtonAdapter >> addModelTo: gtkButton [

	widget := gtkButton.

	self model label isEmptyOrNil ifFalse: [self updateLabel].
	self model icon ifNotNil: [self updateIcon].
	self model help ifNotNil: [self updateTooltip].
	
	gtkButton connectClicked: self model action value.
	
	model whenLabelChangedDo: [ self updateLabel ].
	model whenIconChangedDo: [ self updateIcon ].

]

{ #category : #factory }
GtkButtonAdapter >> newWidget [ 
	
	^ GtkButton newLabel: self model label asString
]

{ #category : #factory }
GtkButtonAdapter >> updateIcon [

	self widget
		alwaysShowImage;
		image: (GtkImage newForm: self model icon)
]

{ #category : #factory }
GtkButtonAdapter >> updateLabel [

	self widget label: self model label asString
]

{ #category : #factory }
GtkButtonAdapter >> updateTooltip [
	self widget tooltipText: self model help
]
