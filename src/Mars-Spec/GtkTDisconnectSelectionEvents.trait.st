Trait {
	#name : #GtkTDisconnectSelectionEvents,
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #private }
GtkTDisconnectSelectionEvents >> disconnectSelectionEventsOf: aWidget during: aBlock [

	aWidget selection 
		disconnect: 'changed' 
		during: aBlock
]
