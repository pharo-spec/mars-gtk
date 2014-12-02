tests
testMenuBar
	| window menubar handles |
	window := GtkWindow view: MarsWindow new.
	menubar := (GtkMenuBar view: MarsMenuBar new).
	window menuBar: menubar.
	
	handles := self collectSubviewHandlesFromHandle: window contentHandle.
	self assert: (handles anySatisfy: [ :each | each = menubar handle ]). 
	