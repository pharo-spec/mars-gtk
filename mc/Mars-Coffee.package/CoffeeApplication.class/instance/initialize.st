initialization
initialize 
	super initialize.
	runLoop := CoffeeRunLoop application: self.
	damagedViews := OrderedCollection new.
