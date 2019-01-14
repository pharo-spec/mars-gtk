"
I'm an adapter to render a TreeTablePresenter with Gtk3.

Since Gtk3 uses a GtkTreeStore to render the tree, and it needs to exists previously (but you can edit it with iterators), I use a trick to not pre-render all elements at once (a task that can be very time/space consuming depending on the tree to present): I use an event of the tree (test-row-expanded) to add a new level to the children of the item I'm expanding. 
Confused? Let's see an example: Let's suppose I have this tree: 

A
	B1
		C1
		C2
	B2
	

In first iteration, I will add just this levels to the store: 

A
	B1
	B2
	
Which will ensure ""A"" will show the expand arrow (since it has children). Now, when I expand ""A"", I need to dig into its children and add childs (to ensure B1 will show an expansion row).
After processing, we will the full tree.  
"
Class {
	#name : #GtkTreeTableAdapter,
	#superclass : #GtkTableAdapter,
	#instVars : [
		'levelsAdded'
	],
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #private }
GtkTreeTableAdapter >> addChildrenFor: anObject into: gtkRow [

	(self model childrenFor: anObject) do: [ :childElement |
		super addRow: childElement into: gtkRow ]
]

{ #category : #private }
GtkTreeTableAdapter >> addLevelTo: item parent: iter [

	(self isLevelAddedFor: item) ifTrue: [ ^ self ].
	"no children, no need to do anything"
	iter hasChildren ifFalse: [ ^ self ].	
	iter childrenDo: [ :each | 
		self 
			addChildrenFor: (self model itemAtPath: each toPathArray) 
			into: each ].
	self markLevelAddedFor: item
]

{ #category : #building }
GtkTreeTableAdapter >> addModelTo: gtkWidget [

	super addModelTo: gtkWidget.
	gtkWidget connectRowExpanded: [ :iter |
		"it will be an orfan iterator (store not setted since it comes from a callback)"
		iter store: self store.
		self addLevelTo: (self model itemAtPath: iter toPathArray) parent: iter ]
]

{ #category : #private }
GtkTreeTableAdapter >> addRow: anObject into: store [
	| gtkRow |

	gtkRow := super addRow: anObject into: store.
	"I will add the first level children of this row"
	self addChildrenFor: anObject into: gtkRow.
			
	^ gtkRow
]

{ #category : #private }
GtkTreeTableAdapter >> initialize [

	super initialize.
	levelsAdded := Set new
]

{ #category : #private }
GtkTreeTableAdapter >> isLevelAddedFor: item [

	^ levelsAdded includes: item
]

{ #category : #private }
GtkTreeTableAdapter >> items [

	^ self model roots
]

{ #category : #private }
GtkTreeTableAdapter >> markLevelAddedFor: item [

	levelsAdded add: item
]

{ #category : #private }
GtkTreeTableAdapter >> store [ 

	^ self widgetDo: [ :w | w child model ]
]

{ #category : #private }
GtkTreeTableAdapter >> storeClass [

	^ GtkTreeStore
]
