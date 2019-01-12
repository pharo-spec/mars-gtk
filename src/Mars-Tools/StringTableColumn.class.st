Class {
	#name : #StringTableColumn,
	#superclass : #TableColumn,
	#instVars : [
		'editable',
		'acceptAction'
	],
	#category : #'Mars-Tools-Inspector'
}

{ #category : #accessing }
StringTableColumn >> acceptAction [

	^ acceptAction
]

{ #category : #visiting }
StringTableColumn >> acceptColumnBuilder: aBuilder [

	^ aBuilder visitStringColumn: self
]

{ #category : #accessing }
StringTableColumn >> beEditable [ 

	editable := true
]

{ #category : #initialization }
StringTableColumn >> initialize [ 

	super initialize.
	editable := false
]

{ #category : #testing }
StringTableColumn >> isEditable [ 
	
	^ editable
]

{ #category : #accessing }
StringTableColumn >> onAcceptEdition: aBlock [

	acceptAction := aBlock
]
