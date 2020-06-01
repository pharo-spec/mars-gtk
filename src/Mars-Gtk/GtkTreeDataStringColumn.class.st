Class {
	#name : #GtkTreeDataStringColumn,
	#superclass : #GtkTreeDataColumn,
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #accessing }
GtkTreeDataStringColumn >> gType [

	^ GType G_TYPE_STRING
]

{ #category : #initialization }
GtkTreeDataStringColumn >> setValueOf: item to: gValue [

	gValue setString: (self readObject: item)
]
