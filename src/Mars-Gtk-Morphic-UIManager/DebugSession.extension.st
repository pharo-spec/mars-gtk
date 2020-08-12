Extension { #name : #DebugSession }

{ #category : #'*Mars-Gtk-Morphic-UIManager' }
DebugSession class >> new [
	
	^ self = DebugSession 
		ifTrue: [ self sessionClass basicNew initialize ]
		ifFalse: [ super new ]
]

{ #category : #'*Mars-Gtk-Morphic-UIManager' }
DebugSession class >> sessionClass [

	^ UIManager default debugSessionClass
]
