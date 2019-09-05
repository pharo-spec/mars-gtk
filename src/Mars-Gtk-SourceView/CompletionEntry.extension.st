Extension { #name : #CompletionEntry }

{ #category : #'*Mars-Gtk-SourceView' }
CompletionEntry >> icon [
	| completion |
	
	completion := self contents.
	completion first isUppercase ifTrue: [ 
		Smalltalk globals 
			at: completion
			ifPresent: [ :aGlobal | ^ aGlobal systemIcon ] ].
	
	^ nil
]
