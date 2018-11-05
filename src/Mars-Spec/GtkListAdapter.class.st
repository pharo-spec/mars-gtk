Class {
	#name : #GtkListAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #specs }
GtkListAdapter class >> adaptingAliases [

	^ #(FastTableAdapter)
]

{ #category : #building }
GtkListAdapter >> addModelTo: gtkList [
	
	gtkList 
		headersVisible: false;
		appendTextColumn;
		model: (GtkTreeStore newStrings: self modelItemsAsDisplay).
]

{ #category : #building }
GtkListAdapter >> buildWidget [
	| gtkList |
	
	gtkList := GtkTreeView new.
	self addModelTo: gtkList.
	^ gtkList			
]

{ #category : #building }
GtkListAdapter >> modelItemsAsDisplay [

	^ self model listItems collect: [ :each | 
		self model displayBlock value: each ]
]
