Class {
	#name : #GtkDialogWindowAdapter,
	#superclass : #GtkWindowAdapter,
	#instVars : [
		'wasModal',
		'waitForAnswer',
		'contentsWidget'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #private }
GtkDialogWindowAdapter >> add: gtkBox toWindow: gtkDialog [

	gtkDialog contentArea packStart: gtkBox.
	self model buttons do: [ :buttonPresenter |
		gtkDialog 
			addButton: buttonPresenter label asString
			do: buttonPresenter action ].
	gtkDialog buttonBox showAll.
	gtkDialog defaultResponse: self model buttons size
]

{ #category : #accessing }
GtkDialogWindowAdapter >> addPresenterIn: gtkWindow withSpecLayout: aSpec [

	gtkWindow showAll.
	self model isCentered ifTrue: [ gtkWindow center ].
	super addPresenterIn: gtkWindow withSpecLayout: aSpec	
]

{ #category : #accessing }
GtkDialogWindowAdapter >> close [

	self widgetDo: [ :w | w respond ]
]

{ #category : #building }
GtkDialogWindowAdapter >> newWidget [

	^ GtkDialogWindow new 
		autoRelease
		resize: self model initialExtent;
		yourself
]

{ #category : #accessing }
GtkDialogWindowAdapter >> open [ 

	self widgetDo: [ :w | ^ w run ]
]
