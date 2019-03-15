Extension { #name : #KMComposedModifier }

{ #category : #'*Mars-Gtk' }
KMComposedModifier >> asGdkModifierType [ 
	
	^ (self modifiers collect: #asGdkModifierType) sum
]
