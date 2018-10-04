Extension { #name : #MADescription }

{ #category : #'*Mars-Magritte' }
MADescription >> presenterClass [
	^ self propertyAt: #presenterClass ifAbsent: [ self class defaultPresenterClass ]	
]

{ #category : #'*Mars-Magritte' }
MADescription >> presenterClass: aClass [
	self propertyAt: #presenterClass put: aClass
]
