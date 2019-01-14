Class {
	#name : #GtkTreeTableAdapter,
	#superclass : #GtkTableAdapter,
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #private }
GtkTreeTableAdapter >> addRow: anObject into: store [
	| gtkRow |

	gtkRow := super addRow: anObject into: store.
	"I will add the first level children of this row"
	(self model childrenFor: anObject) do: [ :childElement |
		super addRow: childElement into: gtkRow ].
		
	^ gtkRow
]

{ #category : #private }
GtkTreeTableAdapter >> items [

	^ self model roots
]

{ #category : #private }
GtkTreeTableAdapter >> storeClass [

	^ GtkTreeStore
]
