"
! GtkTreeDataPixbufColumn

A data column that provides a Boolean (used for checkboxes and others).
"
Class {
	#name : #GtkTreeDataBooleanColumn,
	#superclass : #GtkTreeDataColumn,
	#category : #'Mars-Gtk-Widget-Tree-Store'
}

{ #category : #accessing }
GtkTreeDataBooleanColumn >> gType [

	^ GType G_TYPE_BOOLEAN
]

{ #category : #accessing }
GtkTreeDataBooleanColumn >> setValueOf: item to: gValue [

	gValue setBoolean: (self readObject: item)
]
