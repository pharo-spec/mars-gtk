Trait {
	#name : #TGtkDisconnectSelectionEvents,
	#category : #'Mars-Spec-Adapter-Table'
}

{ #category : #private }
TGtkDisconnectSelectionEvents >> disconnectSelectionEventsOf: aWidget during: aBlock [

	aWidget selection 
		disconnect: 'changed' 
		during: aBlock
]
