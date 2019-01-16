Extension { #name : #Object }

{ #category : #'*Mars-Tools' }
Object >> allInspectorNodes [
	"Answer a list of attributes as nodes"
	
	^ { StInspectorSelfNode newObject: self }, self inspectorNodes
]

{ #category : #'*Mars-Tools' }
Object >> inspectorDisplayString [

	self flag: #TODO. "Reuse gt? For now, I'm just reusing this part. 
	I need to decide how to keep most of the 'model' parts of gt to not work double. 
	But many things seems too orientated to glamour. 
	Not this case, though."
	^ self gtDisplayString
]

{ #category : #'*Mars-Tools' }
Object >> inspectorIcon [

	self flag: #TODO. "Reuse gt?"
	^ self iconOrThumbnailOfSize: 16
]

{ #category : #'*Mars-Tools' }
Object >> inspectorNodes [
	"Answer a list of attributes as nodes"
	
	^ (self class allSlots collect: [ :each |
		StInspectorSlotNode newObject: self slot: each ])
]

{ #category : #'*Mars-Tools' }
Object >> rawInspection [
	"This is the most basic presentation showing the state of the object"
	^ StRawInspection on: self
]
