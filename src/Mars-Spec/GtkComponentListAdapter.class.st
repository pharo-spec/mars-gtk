Class {
	#name : #GtkComponentListAdapter,
	#superclass : #GtkAdapter,
	#category : #'Mars-Spec-Adapter'
}

{ #category : #specs }
GtkComponentListAdapter class >> adaptingAliases [

	^ #(FastTableAdapter)
]

{ #category : #building }
GtkComponentListAdapter >> addModelTo: gtkListBox [
	widget := gtkListBox .
	self presenter
		property: #presenters
		whenChangedDo: [ :collection | 
			self updateWith: collection ].
	self updateWith: self presenter presenters
]

{ #category : #building }
GtkComponentListAdapter >> updateWith: aCollection [
	| listItem |
	widget removeAll.
	aCollection
		doWithIndex: [ :p :i | 
			listItem := p buildWithSpec asListBoxRow.
			widget add: listItem.
			widget showAll ]
]

{ #category : #building }
GtkComponentListAdapter >> widgetClass [
	
	^ GtkListBox
]
