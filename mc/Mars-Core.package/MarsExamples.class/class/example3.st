examples
example3
	"Show a menu bar"
	GtkToolkit useToolkit.
	MarsApplication new start.
	MarsWindow new 
		title: 'Test';
		bounds: (500@100 extent: 800@600);
		menuBar: (MarsMenuBar new 
			addSubview: ((MarsMenu label: 'File')
				addSubview: (MarsMenuItem label: 'Exit');
				yourself);
			yourself);
		show