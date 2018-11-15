"
GtkDialogWindow — Create popup windows

https://developer.gnome.org/gtk3/stable/GtkDialog.html

In fact, I'm a simulation of what happens in the real GtkDialog. This is need because GtkDialog>>run function will in fact takeover the run loop, hanging the VM loop (and making us unable to handle events).
"
Class {
	#name : #GtkDialogWindow,
	#superclass : #GtkWindow,
	#instVars : [
		'contentArea',
		'buttonBox',
		'defaultResponse',
		'runContext'
	],
	#pools : [
		'GtkResponseType'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #private }
GtkDialogWindow class >> windowNew: type [ 

	^ self ffiCall: #( GtkDialogWindow *gtk_window_new ( GtkWindowType type ) )
]

{ #category : #adding }
GtkDialogWindow >> addButton: aString do: aBlock [

	buttonBox packStart: ((GtkButton newLabel: aString)
		connectClicked: [ 
			aBlock value.
			self flag: #TODO. "Is this ok? Maybe I need to give the respond control to the action.
			In that case, a true/false will do it"
			self respond ];
		yourself)
]

{ #category : #accessing }
GtkDialogWindow >> contentArea [

	^ contentArea
]

{ #category : #accessing }
GtkDialogWindow >> defaultResponse: aNumber [
	"number of response to be executed by default"

	defaultResponse := aNumber
]

{ #category : #initialization }
GtkDialogWindow >> initialize [

	super initialize.
	defaultResponse := 0.
	self add: (GtkBox newVertical
		packStart: (contentArea := self newContentArea);
		packEnd: (buttonBox := self newButtonBox)
			expand: false 
			fill: false 
			padding: 0;
		yourself)
]

{ #category : #testing }
GtkDialogWindow >> isRunning [ 

	^ runContext notNil
]

{ #category : #'private factory' }
GtkDialogWindow >> newButtonBox [

	^ GtkButtonBox newHorizontal placeAtEnd
]

{ #category : #'private factory' }
GtkDialogWindow >> newContentArea [ 

	^ GtkBox newVertical
]

{ #category : #private }
GtkDialogWindow >> respond [ 

	self runContext resume.
	self hide
]

{ #category : #running }
GtkDialogWindow >> run [

	self isRunning ifTrue: [ self error: 'Dialog is already running!' ].
	
	self isVisible ifFalse: [ self showAll ].
	runContext := GtkDialogRunContext newDialog: self.
	^ [ runContext run ]
	ensure: [ runContext := nil ]
]

{ #category : #private }
GtkDialogWindow >> runContext [

	^ runContext
]

{ #category : #private }
GtkDialogWindow >> windowDestroyed [

	super windowDestroyed.
	self isRunning ifTrue: [ 
		self runContext windowDestroyed ]
]
