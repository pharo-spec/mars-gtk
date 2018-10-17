Extension { #name : #KMAltModifier }

{ #category : #'*Mars-Gtk' }
KMAltModifier >> asGdkModifierType [ 
	
	self flag: #TODO. "This is wrong"
	^ GdkModifierType GDK_SUPER_MASK
]
