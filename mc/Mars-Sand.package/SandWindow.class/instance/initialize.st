initialization
initialize 
	super initialize.
	self visible: false. "By default, is not visible"
	self view addSubview: (MarsUndefinedContainer platformViewClass: SandWindowHeader).