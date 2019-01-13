Class {
	#name : #TablePresenter,
	#superclass : #AbstractWidgetPresenter,
	#instVars : [
		'columns',
		'itemsHolder'
	],
	#category : #'Mars-Tools-Inspector'
}

{ #category : #specs }
TablePresenter class >> adapterName [

	^ #TableAdapter
]

{ #category : #accessing }
TablePresenter >> addColumn: aColumn [

	columns := columns copyWith: aColumn
]

{ #category : #accessing }
TablePresenter >> columns [
	^ columns
]

{ #category : #accessing }
TablePresenter >> columns: aCollection [

	columns := aCollection
]

{ #category : #initialization }
TablePresenter >> initialize [ 

	super initialize.
	columns := #().
	itemsHolder := #() asValueHolder.
	
	itemsHolder whenChangedDo: [ self itemsChanged ].
]

{ #category : #accessing }
TablePresenter >> itemAt: aNumber [
	
	^ self items at: aNumber
]

{ #category : #accessing }
TablePresenter >> items [

	^ itemsHolder value
]

{ #category : #accessing }
TablePresenter >> items: aSequenceableCollection [

	itemsHolder value: aSequenceableCollection
]

{ #category : #private }
TablePresenter >> itemsChanged [

	self changed: #items
]
