Class {
	#name : #GtkDialogWindowAdapter,
	#superclass : #GtkWindowAdapter,
	#instVars : [
		'wasModal',
		'waitForAnswer'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #private }
GtkDialogWindowAdapter >> add: gtkBox toWindow: gtkDialog [

	gtkDialog contentArea packStart: gtkBox.
	self model buttons
		keysAndValuesDo: [ :label :action |
			gtkDialog addButton: label do: action ].
	gtkDialog defaultResponse: self model buttons size
]

{ #category : #accessing }
GtkDialogWindowAdapter >> addModelIn: gtkWindow withSpecLayout: aSpec [

	self model isCentered ifTrue: [ gtkWindow center ].
	super addModelIn: gtkWindow withSpecLayout: aSpec	
]

{ #category : #building }
GtkDialogWindowAdapter >> buildWidget [

	^ GtkDialogWindow new 
		autoRelease
		resize: self model initialExtent;
		yourself
]

{ #category : #private }
GtkDialogWindowAdapter >> contentWidget: aSpec [

	^ self model contents
]

{ #category : #accessing }
GtkDialogWindowAdapter >> open [ 
	self widgetDo: [ :w | w run ]
]
