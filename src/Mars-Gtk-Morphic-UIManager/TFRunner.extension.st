Extension { #name : #TFRunner }

{ #category : #'*Mars-Gtk-Morphic-UIManager' }
TFRunner >> handleExceptionDuring: aBlock [

	UIManager default
		handleCallbackExceptionsWith: self exceptionHandler  
		during: aBlock
]
