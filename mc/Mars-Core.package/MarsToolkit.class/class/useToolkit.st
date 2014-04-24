accessing
useToolkit
	self = MarsToolkit ifTrue: [ 
		self error: 'I''m abstract. Use one of my children instead.' ].
	self current: self new