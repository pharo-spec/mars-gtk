Class {
	#name : #GtkComponentListAdapter,
	#superclass : #GtkAdapter,
	#instVars : [
		'realWidget'
	],
	#classInstVars : [
		'gtkWidget',
		'realWidget'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #specs }
GtkComponentListAdapter class >> adaptingAliases [

	^ #(FastTableAdapter)
]

{ #category : #building }
GtkComponentListAdapter >> addModelTo: gtkListBox [
	widget := gtkListBox .
	realWidget := gtkListBox.
	self presenter
		property: #presenters
		whenChangedDo: [ :collection | 
			self updateWith: collection ].
	self updateWith: self presenter presenters
]

{ #category : #building }
GtkComponentListAdapter >> updateWith: aCollection [
	| listItem |
	realWidget removeAll.
	aCollection
		doWithIndex: [ :p :i | 
			listItem := p buildWithSpec asListBoxRow.
			realWidget add: listItem.
			widget showAll ]
]

{ #category : #building }
GtkComponentListAdapter >> widgetClass [
	
	^ GtkListBox
]

{ #category : #building }
GtkComponentListAdapter >> wrapWidget: gtkWidget [
	realWidget := gtkWidget.
	^ (GtkScrolledWindow newWidget: gtkWidget)
		show;
		yourself
]
