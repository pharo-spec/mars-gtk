Extension { #name : #Object }

{ #category : #'*Mars-Gtk-Utils' }
Object >> printToStdout [

	Stdio stdout << self printString << OSPlatform current lineEnding 
]
