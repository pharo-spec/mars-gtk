Extension { #name : #SpMockMenu }

{ #category : #'*Mars-GtkBackendTests' }
SpMockMenu >> children [
	"hack for test. 
	 In populate-popup events (textview, entry) the callback will enter here 
	 as a prove I'm in the right callback. 
	 I answer empty to avoid after processing, but I'm already fine"
	
	self shown: true.
	
	^ #()
]

{ #category : #'*Mars-GtkBackendTests' }
SpMockMenu >> connectDestroy: aBlock [

	
]

{ #category : #'*Mars-GtkBackendTests' }
SpMockMenu >> popupAtPointer: event [

	self shown: true
]

{ #category : #'*Mars-GtkBackendTests' }
SpMockMenu >> showAll [
]
