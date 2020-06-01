Class {
	#name : #GtkTreeDataPixbufColumn,
	#superclass : #GtkTreeDataColumn,
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #accessing }
GtkTreeDataPixbufColumn >> gType [

	^ GType G_TYPE_OBJECT
]

{ #category : #initialization }
GtkTreeDataPixbufColumn >> setValueOf: item to: gValue [
	| image |

	image := self readObject: item.
	gValue setObject: (self store
		imageAt: image 
		ifAbsentPut: [ image asGdkPixbuf ])
		 getHandle
]
