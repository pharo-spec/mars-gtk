Class {
	#name : #GtkAbstractListAdapter,
	#superclass : #GtkAdapter,
	#traits : 'TGtkDisconnectSelectionEvents',
	#classTraits : 'TGtkDisconnectSelectionEvents classTrait',
	#category : #'Mars-Spec-Adapter-List'
}

{ #category : #private }
GtkAbstractListAdapter >> newTreeStore [

	self subclassResponsibility
]

{ #category : #events }
GtkAbstractListAdapter >> refreshList [
	
	self innerWidgetDo: [ :w |
		self 
			disconnectSelectionEventsOf: w
			during: [ w model: self newTreeStore ] ]
]

{ #category : #accessing }
GtkAbstractListAdapter >> refreshWidgetSelection [
	| rowIndexes selection |

	self hasWidget ifFalse: [ ^ self ].

	rowIndexes := self presenter selection selectedIndexes.
	selection := self innerWidget selection.
	(selection allSelected collect: #first) asArray = rowIndexes
		ifTrue: [ ^ self ].

	self 
		disconnectSelectionEventsOf: self innerWidget 
		during: [ 		
			rowIndexes 
				ifNotEmpty: [ self innerWidget selection selectPath: rowIndexes ]
				ifEmpty: [ self innerWidget selection unselectAll ] ]
]

{ #category : #building }
GtkAbstractListAdapter >> resetSelection [

	self innerWidget selection unselectAll
]

{ #category : #accessing }
GtkAbstractListAdapter >> selectIndex: anInteger [ 
	
	self innerWidgetDo: [ :w |
		anInteger ~= 0
			ifTrue: [ w selectIndex: anInteger ]
			ifFalse: [ self resetSelection ] ]
]

{ #category : #building }
GtkAbstractListAdapter >> takeKeyboardFocus [
	| needToCleanUP |

	self hasWidget ifFalse: [ ^ self ].
	self flag: #hack.
	"GTK has an issue when giving the focus to a List. When it gives the focus selects the first element"	
	needToCleanUP := self presenter selection isEmpty.
	needToCleanUP 
		ifTrue: [ 
			self disconnectSelectionEventsOf: self innerWidget during: [ 
				self doTakeKeyboardFocus.
				self innerWidget selection unselectAll ] ]
		ifFalse: [ 
			self doTakeKeyboardFocus ]
]

{ #category : #building }
GtkAbstractListAdapter >> widgetClass [
	
	^ GtkTreeView
]
