tests
testMenuBar
	| window menubar |
	window := GtkWindow view: MarsWindow new.
	menubar := (GtkMenuBar view: MarsMenuBar new).
	window menuBar: menubar.
	
	self assert: ((self collectSubviewHandles: window) anySatisfy: [ :each | each = menubar handle ]). 
	