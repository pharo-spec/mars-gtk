Extension { #name : #NECEntry }

{ #category : #'*Mars-Gtk-SourceView' }
NECEntry >> icon [
	| completion |
	
	completion := self contents.
	completion first isUppercase ifTrue: [ 
		Smalltalk globals 
			at: completion
			ifPresent: [ :aGlobal | ^ aGlobal systemIcon ] ].
	
	^ nil
]
