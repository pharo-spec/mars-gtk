private
basicAddSubview: aView 
	self 
		assert: aView isMenu
		description: 'Just menu views can be added to menu bars!'.
	self platformView addSubview: aView platformView.
	subviews := subviews copyWith: aView.
	^ aView