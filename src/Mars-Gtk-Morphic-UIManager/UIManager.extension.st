Extension { #name : #UIManager }

{ #category : #'*Mars-Gtk-Morphic-UIManager' }
UIManager >> debugSessionClass [

	^ DebugSession
]

{ #category : #'*Mars-Gtk-Morphic-UIManager' }
UIManager >> handleCallbackExceptionsWith: exceptionHandler during: aBlock [

	exceptionHandler handleExceptionDuring: aBlock	
]
