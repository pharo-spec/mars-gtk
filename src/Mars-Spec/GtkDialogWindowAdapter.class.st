Class {
	#name : #GtkDialogWindowAdapter,
	#superclass : #GtkWindowAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #private }
GtkDialogWindowAdapter >> add: gtkBox toWindow: gtkWindow [

	gtkWindow contentArea 
		packStart: gtkBox
]

{ #category : #accessing }
GtkDialogWindowAdapter >> addModelIn: gtkWindow withSpecLayout: aSpec [

	self model isCentered 
		ifTrue: [ gtkWindow center ].
	super addModelIn: gtkWindow withSpecLayout: aSpec	
]

{ #category : #building }
GtkDialogWindowAdapter >> buildWidget [

	^ GtkDialog new 
		autoRelease
		resize: self model initialExtent;
		yourself.

]

{ #category : #private }
GtkDialogWindowAdapter >> contentWidget: aSpec [

	^ self model contents
]
