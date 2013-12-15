initialization
initialize 
	super initialize.
	runLoop := SandRunLoop application: self.
	damagedViews := OrderedCollection new.
