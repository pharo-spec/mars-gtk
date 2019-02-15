Class {
	#name : #GtkSelectionMode,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_SELECTION_BROWSE',
		'GTK_SELECTION_MULTIPLE',
		'GTK_SELECTION_NONE',
		'GTK_SELECTION_SINGLE'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #'accessing enum' }
GtkSelectionMode class >> GTK_SELECTION_BROWSE [
	"This method was automatically generated"
	^ GTK_SELECTION_BROWSE
]

{ #category : #'accessing enum' }
GtkSelectionMode class >> GTK_SELECTION_MULTIPLE [
	"This method was automatically generated"
	^ GTK_SELECTION_MULTIPLE
]

{ #category : #'accessing enum' }
GtkSelectionMode class >> GTK_SELECTION_NONE [
	"This method was automatically generated"
	^ GTK_SELECTION_NONE
]

{ #category : #'accessing enum' }
GtkSelectionMode class >> GTK_SELECTION_SINGLE [
	"This method was automatically generated"
	^ GTK_SELECTION_SINGLE
]

{ #category : #'enum declaration' }
GtkSelectionMode class >> enumDecl [

	^ #( 
	  GTK_SELECTION_NONE 	0
	  GTK_SELECTION_SINGLE 1
	  GTK_SELECTION_BROWSE 2
	  GTK_SELECTION_MULTIPLE 3
	)
	

]
