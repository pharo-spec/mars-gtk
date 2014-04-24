testing
isAbstract
	^ super isAbstract or: [ self = GtkTestCase ]