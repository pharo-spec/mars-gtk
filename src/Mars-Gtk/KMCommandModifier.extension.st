Extension { #name : #KMCommandModifier }

{ #category : #'*Mars-Gtk' }
KMCommandModifier >> asGdkModifierType [ 

	self flag: #TODO. "This is wrong"	
	^ GdkModifierType GDK_META_MASK
]
