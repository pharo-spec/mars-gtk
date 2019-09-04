"
I'm a base dialog.
I'm the foundation of modal behaviour, which I implement in the #run method.

Since the regular Gtk design will take over the event loop (and it will hang the image), we need to implement our own mechanism. This follows the same design as the original gtk_dialog_run.
"
Class {
	#name : #GtkBaseDialog,
	#superclass : #GtkWindow,
	#instVars : [
		'runContext'
	],
	#pools : [
		'GtkResponseType'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #accessing }
GtkBaseDialog class >> gType [ 

	^ nil
]

{ #category : #initialization }
GtkBaseDialog >> initialize [ 

	super initialize.
	self initializeTitleBar.
	self initializeKeyBindings
]

{ #category : #initialization }
GtkBaseDialog >> initializeKeyBindings [
	"| group |
	
	group := GtkAccelGroup new.
	self addAcceleratorGroup: group.
	self addAccelerator: 'hide' group: group shortcut: Character escape asKeyCombination"
	
]

{ #category : #initialization }
GtkBaseDialog >> initializeTitleBar [
	
	"self titleBar: (GtkHeaderBar new
		title: 'Untitled dialog';
		yourself)"
]

{ #category : #testing }
GtkBaseDialog >> isRunning [ 

	^ runContext notNil
]

{ #category : #private }
GtkBaseDialog >> respond [ 

	self runContext resume.
	self hide
]

{ #category : #running }
GtkBaseDialog >> run [

	self isRunning ifTrue: [ self error: 'Dialog is already running!' ].
	
	runContext := GtkDialogRunContext newDialog: self.
	^ [ runContext run ]
	ensure: [ runContext := nil ]
]

{ #category : #private }
GtkBaseDialog >> runContext [

	^ runContext
]

{ #category : #finalization }
GtkBaseDialog >> windowDestroyed [

	super windowDestroyed.
	self isRunning ifTrue: [ 
		self runContext windowDestroyed ]
]
