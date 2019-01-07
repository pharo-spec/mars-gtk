Extension { #name : #Object }

{ #category : #'*Mars-Tools' }
Object >> inspectorNodes [
	"Answer a list of attributes as nodes"
	
	^ { StInspectorSelfNode newObject: self }, 
	  (self class allSlots collect: [ :each |
		StInspectorSlotNode newObject: self slot: each ])
]

{ #category : #'*Mars-Tools' }
Object >> rawInspection [
	"This is the most basic presentation showing the state of the object"
	^ StRawInspection on: self
]
