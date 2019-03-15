"
Describes which edge of a widget a certain feature is positioned at, e.g. the tabs of a GtkNotebook, the handle of a GtkHandleBox or the label of a GtkScale.

"
Class {
	#name : #GtkPositionType,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_POS_BOTTOM',
		'GTK_POS_LEFT',
		'GTK_POS_RIGHT',
		'GTK_POS_TOP'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkPositionType class >> GTK_POS_BOTTOM [
	"This method was automatically generated"
	^ GTK_POS_BOTTOM
]

{ #category : #'accessing enum' }
GtkPositionType class >> GTK_POS_LEFT [
	"This method was automatically generated"
	^ GTK_POS_LEFT
]

{ #category : #'accessing enum' }
GtkPositionType class >> GTK_POS_RIGHT [
	"This method was automatically generated"
	^ GTK_POS_RIGHT
]

{ #category : #'accessing enum' }
GtkPositionType class >> GTK_POS_TOP [
	"This method was automatically generated"
	^ GTK_POS_TOP
]

{ #category : #'enum declaration' }
GtkPositionType class >> enumDecl [
	^ #(
	GTK_POS_LEFT 	0
  	GTK_POS_RIGHT 	1
  	GTK_POS_TOP 		2
  	GTK_POS_BOTTOM 	3
	)
]
