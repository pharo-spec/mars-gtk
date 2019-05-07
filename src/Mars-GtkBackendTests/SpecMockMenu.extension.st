Extension { #name : #SpecMockMenu }

{ #category : #'*Mars-GtkBackendTests' }
SpecMockMenu >> children [
	"hack for test. 
	 In populate-popup events (textview, entry) the callback will enter here 
	 as a prove I'm in the right callback. 
	 I answer empty to avoid after processing, but I'm already fine"
	
	self shown: true.
	
	^ #()
]

{ #category : #'*Mars-GtkBackendTests' }
SpecMockMenu >> connectDestroy: aBlock [

	
]

{ #category : #'*Mars-GtkBackendTests' }
SpecMockMenu >> popupAtPointer: event [

	self shown: true
]

{ #category : #'*Mars-GtkBackendTests' }
SpecMockMenu >> showAll [
]
