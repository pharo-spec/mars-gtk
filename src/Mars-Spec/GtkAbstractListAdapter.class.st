Class {
	#name : #GtkAbstractListAdapter,
	#superclass : #GtkAdapter,
	#traits : 'TGtkDisconnectSelectionEvents',
	#classTraits : 'TGtkDisconnectSelectionEvents classTrait',
	#instVars : [
		'lastShownMenu'
	],
	#category : #'Mars-Spec-Adapter-List'
}

{ #category : #building }
GtkAbstractListAdapter >> buildMenu: aMenuPresenter [

	^ aMenuPresenter 
		owner: self model;
		buildWithSpec
]

{ #category : #private }
GtkAbstractListAdapter >> newTreeStore [

	self subclassResponsibility
]

{ #category : #events }
GtkAbstractListAdapter >> refreshList [
	
	self widgetDo: [ :w |
		self 
			disconnectSelectionEventsOf: w
			during: [ w model: self newTreeStore ] ]
]

{ #category : #accessing }
GtkAbstractListAdapter >> refreshWidgetSelection [
	| rowIndexes selection |
	
	self widget ifNil: [ ^ self ].

	rowIndexes := self presenter selection selectedIndexes.
	selection := self widget selection.
	(selection allSelected collect: #first) asArray = rowIndexes
		ifTrue: [ ^ self ].

	self 
		disconnectSelectionEventsOf: self widget 
		during: [ 		
			rowIndexes 
				ifNotEmpty: [ self widget selection selectPath: rowIndexes ]
				ifEmpty: [ self widget selection unselectAll ] ]
]

{ #category : #building }
GtkAbstractListAdapter >> resetSelection [

	self widget selection unselectAll
]

{ #category : #accessing }
GtkAbstractListAdapter >> selectIndex: anInteger [ 
	
	self widgetDo: [ :w |
		anInteger ~= 0
			ifTrue: [ w selectIndex: anInteger ]
			ifFalse: [ self resetSelection ] ]
]

{ #category : #building }
GtkAbstractListAdapter >> takeKeyboardFocus [
	| needToCleanUP |

	self widget ifNil: [ ^ self ].
	self flag: #hack.
	"GTK has an issue when giving the focus to a List. When it gives the focus selects the first element"	
	needToCleanUP := self presenter selection isEmpty.
	needToCleanUP 
		ifTrue: [ 
			self disconnectSelectionEventsOf: self widget during: [ 
				self doTakeKeyboardFocus.
				self widget selection unselectAll ] ]
		ifFalse: [ 
			self doTakeKeyboardFocus ]
]

{ #category : #building }
GtkAbstractListAdapter >> widgetClass [
	
	^ GtkTreeView
]
