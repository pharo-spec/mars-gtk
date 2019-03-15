Extension { #name : #FFIExternalResourceManager }

{ #category : #'*Mars-Gtk' }
FFIExternalResourceManager class >> removeResource: anObject [
	^ self uniqueInstance removeResource: anObject
]
