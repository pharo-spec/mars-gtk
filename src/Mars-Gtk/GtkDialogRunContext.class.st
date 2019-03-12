"
I'm an execution context for dialogs.

Since we cannot use a regular gtk_dialog_run call to execute a modal dialog because it takes 
over the event loop and that would hang the full application making impossible to continue 
evaluating callbacks or executing callouts, we need to simulate that behaviour.
"
Class {
	#name : #GtkDialogRunContext,
	#superclass : #Object,
	#instVars : [
		'dialog',
		'wasModal',
		'wasDestroyed',
		'waitForAnswer'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #'instance creation' }
GtkDialogRunContext class >> new [

	self error: 'Use #newDialog:'
]

{ #category : #'instance creation' }
GtkDialogRunContext class >> newDialog: aGtkDialog [

	^ self basicNew 
		initializeDialog: aGtkDialog;
		yourself
]

{ #category : #accessing }
GtkDialogRunContext >> dialog [ 

	^ dialog
]

{ #category : #running }
GtkDialogRunContext >> doAfterRun [

	wasDestroyed ifTrue: [ ^ self ].
	
	self flag: #REVIEW. "For some reason, removing the modal state is breaking the flow (seems 
	is letting the modal state in some weird status and system does not receives more events).
	I deactivating this because that way it seems working... at least for now :)"
	"wasModal ifFalse: [ self dialog beNotModal ]."
	self dialog 
		disconnect: 'unmap';
		disconnect: 'delete-event'.
	self dialog objectUnref
]

{ #category : #running }
GtkDialogRunContext >> doBeforeRun [

	"Ensure dialog is not collected while running"
	self dialog objectRef.
	"A dialog is modal"
	wasModal ifFalse: [ self dialog beModal ].
	"Connect interesting signals"
	self dialog 
		connectUnmap: [ self resume ];
		connectDeleteEvent: [ [ self resume ] fork. false ].
	"in original code this is done here, but we are handling window destruction 
	 in window code (to properly handle resitration), then we will hook there 
	 instead here. Other solution would be to stack callbacks on same signal 
	 but that seems overkilling right now"	
	"self dialog connectDestroy: [ wasDestroyed := true. self resume ]".
]

{ #category : #initialization }
GtkDialogRunContext >> initializeDialog: aGtkDialog [

	self initialize.
	dialog := aGtkDialog.
	wasModal := aGtkDialog isModal.
	wasDestroyed := false.
	waitForAnswer := Semaphore new
]

{ #category : #accessing }
GtkDialogRunContext >> resume [

	waitForAnswer signal
]

{ #category : #running }
GtkDialogRunContext >> run [ 

	self doBeforeRun.
	self waitForAnswer.
	self doAfterRun.
	"here we can return something"
	"^ result"
]

{ #category : #private }
GtkDialogRunContext >> waitForAnswer [ 

	waitForAnswer wait
]

{ #category : #'event handling' }
GtkDialogRunContext >> windowDestroyed [

	wasDestroyed := true.
	self resume
]
