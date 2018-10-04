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

{ #category : #'enum declaration' }
GtkPositionType class >> enumDecl [
	^ #(
	GTK_POS_LEFT 	0
  	GTK_POS_RIGHT 	1
  	GTK_POS_TOP 		2
  	GTK_POS_BOTTOM 	3
	)
]
