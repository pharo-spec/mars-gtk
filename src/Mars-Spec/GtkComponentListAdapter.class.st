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
		whenChangedDo: [ :collection | self updateWith: collection ].
	self updateWith: self presenter presenters
]

{ #category : #building }
GtkComponentListAdapter >> updateWith: aCollection [
	aCollection
		doWithIndex: [ :p :i | widget prependWidget: p buildWithSpec ]
]

{ #category : #building }
GtkComponentListAdapter >> widgetClass [
	
	^ GtkListBox
]
