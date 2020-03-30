Extension { #name : #DebugSession }

{ #category : #'*Mars-Gtk-Morphic-UIManager' }
DebugSession class >> new [

	^ self sessionClass basicNew initialize
]

{ #category : #'*Mars-Gtk-Morphic-UIManager' }
DebugSession class >> sessionClass [

	^ UIManager default debugSessionClass
]
