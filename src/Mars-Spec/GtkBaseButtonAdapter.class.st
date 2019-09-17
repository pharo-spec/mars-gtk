Class {
	#name : #GtkBaseButtonAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkBaseButtonAdapter >> addModelTo: gtkButton [

	super addModelTo: gtkButton.

	widget := gtkButton.

	self presenter label isEmptyOrNil ifFalse: [ self updateLabel ].
	self presenter icon ifNotNil: [ self updateIcon ].
	
	self presenter contextMenu ifNotNil: [ :menu |
		self addMenu: menu to: gtkButton ].
	
	model whenLabelChangedDo: [ self updateLabel ].
	model whenIconChangedDo: [ self updateIcon ]
]

{ #category : #accessing }
GtkBaseButtonAdapter >> icon [
	^ widget image
]

{ #category : #updating }
GtkBaseButtonAdapter >> updateIcon [

	self widget
		alwaysShowImage;
		image: (GtkImage newForm: self model icon)
]

{ #category : #updating }
GtkBaseButtonAdapter >> updateLabel [

	self widget label: self model label asString
]

{ #category : #updating }
GtkBaseButtonAdapter >> updateTooltip [
	self widget tooltipText: self model help
]
