initialization
initialize 
	super initialize.
	self view 
		addSubview: (titleLabel := MarsLabel new);
		addSubview: (closeButton := MarsButton new)	.
			
	titleLabel text: MarsWindow defaultTitle.
	closeButton when: MarsClickAction do: [ self close ].