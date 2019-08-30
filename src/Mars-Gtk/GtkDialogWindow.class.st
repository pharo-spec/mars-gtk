"
GtkDialogWindow — Create popup windows

https://developer.gnome.org/gtk3/stable/GtkDialog.html

In fact, I'm a simulation of what happens in the real GtkDialog. This is need because GtkDialog>>run function will in fact takeover the run loop, hanging the VM loop (and making us unable to handle events).
"
Class {
	#name : #GtkDialogWindow,
	#superclass : #GtkBaseDialog,
	#instVars : [
		'contentArea',
		'buttonBox',
		'defaultResponse'
	],
	#pools : [
		'GtkResponseType'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #defaults }
GtkDialogWindow class >> defaultBorderWidth [

	^ 5
]

{ #category : #defaults }
GtkDialogWindow class >> defaultSpacing [
	"Default space between buttons"

	^ 5
]

{ #category : #accessing }
GtkDialogWindow class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_dialog_window_get_type())
]

{ #category : #'instance creation' }
GtkDialogWindow class >> newParent: aWindow [

	^ (self windowNew: GTK_WINDOW_TOPLEVEL) 
		initializeParent: aWindow;
		yourself
]

{ #category : #private }
GtkDialogWindow class >> windowNew: type [ 

	^ self ffiCall: #( GtkDialogWindow *gtk_window_new ( GtkWindowType type ) )
]

{ #category : #adding }
GtkDialogWindow >> addButton: aString do: aBlock [

	buttonBox packStart: ((GtkButton newLabel: aString)
		connectClicked: aBlock;
		yourself)
]

{ #category : #accessing }
GtkDialogWindow >> buttonBox [

	^ buttonBox
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

{ #category : #initialization }
GtkDialogWindow >> initializeParent: aWindow [

	self initialize.
	aWindow ifNotNil: [ self transientTo: aWindow ]
]

{ #category : #'private factory' }
GtkDialogWindow >> newButtonBox [

	^ GtkButtonBox newHorizontal 
		placeAtEnd;
		spacing: self class defaultSpacing;
		borderWidth: self class defaultBorderWidth;
		yourself
]

{ #category : #'private factory' }
GtkDialogWindow >> newContentArea [ 

	^ GtkBox newVertical
]
