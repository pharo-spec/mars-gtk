testing
isAbstract 
	^ super isAbstract or: [ self = GtkWidgetTestCase ]