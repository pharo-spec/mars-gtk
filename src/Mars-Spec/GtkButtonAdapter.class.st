Class {
	#name : #GtkButtonAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #factory }
GtkButtonAdapter >> addModelTo: gtkButton [
	
	self model label isEmptyOrNil ifFalse: [
		gtkButton label: self model label asString  ].
	self model icon ifNotNil: [ :icon | 
		gtkButton 
			alwaysShowImage;
			image: (GtkImage newForm: icon) ].
	self model help ifNotNil: [ :help | 
		gtkButton tooltipText: help ].

	gtkButton connectClicked: self model action
]

{ #category : #factory }
GtkButtonAdapter >> buildWidget [
	| gtkButton |
	
	gtkButton := GtkButton newLabel: self model label asString.
	self addModelTo: gtkButton.
	^ gtkButton
]
