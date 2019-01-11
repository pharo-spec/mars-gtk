Class {
	#name : #GtkTableAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #building }
GtkTableAdapter >> addModelTo: gtkWidget [
	| renderer |
	
	self flag: #TODO. "For now I'm just adding text columns (while there are possible a lot others)"
	
	gtkWidget model: (self newStoreFrom: self model items).

	renderer := GtkCellRendererText new.	
	self model columns withIndexDo: [ :each :index |
		gtkWidget appendColumn: (GtkTreeViewColumn new
			title: each title;
			renderer: renderer;
			setAttribute: 'text' toColumAtIndex: index - 1 forRenderer: renderer;
			in: [ :this | 
				each width ifNotNil: [ :w | this minWidth: w ] ];
			yourself) ].
]

{ #category : #building }
GtkTableAdapter >> buildWidget [
	| gtkTextView |

	gtkTextView := self newWidget.
	self addModelTo: gtkTextView.
	^ GtkScrolledWindow newWidget: gtkTextView
]

{ #category : #building }
GtkTableAdapter >> newStoreFrom: aCollection [
	| store |

	store := GtkListStore newColumnTypes: (Array 
		new: self model columns size 
		withAll: GType G_TYPE_STRING).

	aCollection do: [ :eachRow | | gtkRow |
		gtkRow := store appendRow.
		self model columns withIndexDo: [ :eachColumn :index | 
			gtkRow 	
				at: (index - 1) 
				put: (eachColumn readObject: eachRow) asString utf8Encoded ] ].

	^ store
]

{ #category : #updating }
GtkTableAdapter >> refreshList [

	widget model: (self newStoreFrom: self model items)
]

{ #category : #updating }
GtkTableAdapter >> update: aSymbol [

	aSymbol == #items ifTrue: [ self refreshList ]
]

{ #category : #building }
GtkTableAdapter >> widgetClass [
	
	^ GtkTreeView
]
