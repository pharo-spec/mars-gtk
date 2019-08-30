"
I'm a confirm dialog. 
I can answer whether the dialog was acepted or not.
"
Class {
	#name : #GtkConfirmDialog,
	#superclass : #GtkMessageDialog,
	#instVars : [
		'accepted',
		'acceptLabel',
		'rejectLabel'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #accessing }
GtkConfirmDialog class >> defaultAcceptLabel [

	^ 'Accept'
]

{ #category : #accessing }
GtkConfirmDialog class >> defaultRejectLabel [

	^ 'Cancel'
]

{ #category : #accessing }
GtkConfirmDialog class >> defaultTitle [

	^ 'Confirm'
]

{ #category : #accessing }
GtkConfirmDialog class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_confirm_dialog_get_type())
]

{ #category : #private }
GtkConfirmDialog class >> windowNew: type [ 

	^ self ffiCall: #( GtkConfirmDialog *gtk_window_new ( GtkWindowType type ) )
]

{ #category : #accessing }
GtkConfirmDialog >> acceptLabel [

	^ acceptLabel ifNil: [ self class defaultAcceptLabel ]
]

{ #category : #accessing }
GtkConfirmDialog >> acceptLabel: anObject [
	acceptLabel := anObject
]

{ #category : #private }
GtkConfirmDialog >> addButtons [

	self addButton: self rejectLabel do: [ self respond ].
	self addButton: self acceptLabel do: [ 
		accepted := true.
		self respond ].	
]

{ #category : #initialization }
GtkConfirmDialog >> initialize [

	super initialize.
	accepted := false
]

{ #category : #accessing }
GtkConfirmDialog >> rejectLabel [

	^ rejectLabel ifNil: [ self class defaultRejectLabel ]
]

{ #category : #accessing }
GtkConfirmDialog >> rejectLabel: anObject [
	rejectLabel := anObject
]

{ #category : #running }
GtkConfirmDialog >> run [ 
	
	super run.
	^ accepted
]
