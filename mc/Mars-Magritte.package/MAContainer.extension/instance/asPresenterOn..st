*Mars-Magritte
asPresenterOn: anObject
	^ self presenterClass  
		memento: (anObject mementoClass
			model: anObject
			description: self)