Class {
	#name : #StRawInspection,
	#superclass : #StInspection,
	#instVars : [
		'attributeTable'
	],
	#category : #'Mars-Tools-Inspector'
}

{ #category : #specs }
StRawInspection class >> defaultSpec [

	^ SpecBoxLayout newVertical 
		add: #attributeTable;
		yourself
]

{ #category : #initialization }
StRawInspection >> initialize [ 

	super initialize.
	self title: 'Raw'
]

{ #category : #initialization }
StRawInspection >> initializeWidgets [
	
	attributeTable := self newTable.
	attributeTable addColumn: (TableColumn new
		title: 'Variable';
		evaluated: #name;
		yourself).
	attributeTable addColumn: (TableColumn new
		title: 'Value';
		evaluated: #stringValue;
		beEditable;
		onAcceptEdition: [ :node :value | node value: value ];
		yourself).
	attributeTable items: self model inspectorNodes
]

{ #category : #initialization }
StRawInspection >> newTable [

	^ self instantiate: TablePresenter
]
