accessing
add: aView 
	self 
		assert: aView isMenu
		description: 'Just menu views can be added to menu bars!'.
	self platformView add: aView platformView.
	items := items copyWith: aView.
	^ aView