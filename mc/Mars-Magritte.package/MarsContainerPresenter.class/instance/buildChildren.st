private
buildChildren
	^ Array streamContents: [ :stream |
		self magritteDescription do: [ :each |
			each isVisible ifTrue: [
				stream nextPut: (each presenterClass
					memento: self memento
					description: each
					parent: self) ] ] ]