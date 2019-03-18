"
A base for simple message dialogs.
My children define some specific-purpose dialogs.

"
Class {
	#name : #GtkMessageDialog,
	#superclass : #GtkDialogWindow,
	#instVars : [
		'messageLabel'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #accessing }
GtkMessageDialog class >> defaultExtent [

	^ 400@100
]

{ #category : #accessing }
GtkMessageDialog class >> defaultMargin [

	^ 10
]

{ #category : #accessing }
GtkMessageDialog class >> defaultTitle [

	^ self subclassResponsibility
]

{ #category : #private }
GtkMessageDialog class >> windowNew: type [ 

	^ self ffiCall: #( GtkMessageDialog *gtk_window_new ( GtkWindowType type ) )
]

{ #category : #private }
GtkMessageDialog >> addButtons [

	self subclassResponsibility
]

{ #category : #accessing }
GtkMessageDialog >> defaultExtent [

	^ self class defaultExtent
]

{ #category : #accessing }
GtkMessageDialog >> defaultMargin [

	^ self class defaultMargin
]

{ #category : #accessing }
GtkMessageDialog >> defaultTitle [

	^ self class defaultTitle
]

{ #category : #initialization }
GtkMessageDialog >> initialize [

	super initialize.
	self title: self defaultTitle.
	self center.
	self resize: self defaultExtent.
	self contentArea 
		borderWidth: self defaultMargin;
		packStart: (messageLabel := GtkLabel new)
]

{ #category : #accessing }
GtkMessageDialog >> message: aString [ 

	messageLabel text: aString
]

{ #category : #initialization }
GtkMessageDialog >> prepareButtons [
	
	buttonBox removeAll.
	self addButtons
]

{ #category : #running }
GtkMessageDialog >> run [ 

	self prepareButtons.
	^ super run
]
