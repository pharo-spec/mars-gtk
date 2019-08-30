"
I'm an information dialog.
"
Class {
	#name : #GtkInformDialog,
	#superclass : #GtkMessageDialog,
	#instVars : [
		'acceptLabel'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #accessing }
GtkInformDialog class >> defaultAcceptLabel [

	^ 'Ok'
]

{ #category : #accessing }
GtkInformDialog class >> defaultTitle [

	^ 'Information'
]

{ #category : #private }
GtkInformDialog class >> windowNew: type [ 

	^ self ffiCall: #( GtkInformDialog *gtk_window_new ( GtkWindowType type ) )
]

{ #category : #accessing }
GtkInformDialog >> acceptLabel [

	^ acceptLabel ifNil: [ self class defaultAcceptLabel ]
]

{ #category : #private }
GtkInformDialog >> addButtons [

	self addButton: self acceptLabel do: [ self respond ]
]
