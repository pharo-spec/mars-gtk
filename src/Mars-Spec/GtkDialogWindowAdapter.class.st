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
	self model buttons do: [ :buttonPresenter |
		gtkDialog 
			addButton: buttonPresenter label asString
			do: buttonPresenter action ].
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

{ #category : #accessing }
GtkDialogWindowAdapter >> close [

	self widgetDo: [ :w | w respond ]
]

{ #category : #private }
GtkDialogWindowAdapter >> contentWidget: aSpec [

	^ self model contents
]

{ #category : #accessing }
GtkDialogWindowAdapter >> open [ 
	self widgetDo: [ :w | 
		self flag: #TODO. "Spec has a very ugly behaviour for dialogs: They open without 
		'stopping the word' waiting for an asnwer. To simulate this, I execute the dialog 
		 in a fork, but this is not the best way to proceed, IMO"
		[ w run ] fork ]
]
