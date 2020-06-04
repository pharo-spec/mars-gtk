"
! GtkTreeDataPixbufColumn

A data column that provides a pixbuf (see *class:GdkPixbuf*).
"
Class {
	#name : #GtkTreeDataPixbufColumn,
	#superclass : #GtkTreeDataColumn,
	#category : #'Mars-Gtk-Widget-Tree-Store'
}

{ #category : #accessing }
GtkTreeDataPixbufColumn >> gType [

	^ GType G_TYPE_OBJECT
]

{ #category : #accessing }
GtkTreeDataPixbufColumn >> setValueOf: item to: gValue [
	| image |

	image := self readObject: item.
	gValue setObject: (self store
		imageAt: image 
		ifAbsentPut: [ image asGdkPixbuf ])
		getHandle
]
