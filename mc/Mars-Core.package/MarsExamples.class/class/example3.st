examples
example3
	"Show a menu bar"
	GtkToolkit useToolkit.
	MarsApplication new start.
	MarsWindow new 
		title: 'Test';
		bounds: (500@100 extent: 800@600);
		menuBar: (MarsMenuBar new 
			add: ((MarsMenuSubmenu label: 'File')
				submenu: (MarsMenu new 
					add: (MarsMenuItem label: 'Edit...');
					add: (MarsMenuItem label: 'Exit');
					yourself);
				yourself);
			add: ((MarsMenuSubmenu label: 'Window')
				submenu: (MarsMenu new 
					add: (MarsMenuItem label: 'Minimize');
					add: (MarsMenuItem label: 'Zoom');
					add: (MarsMenuItem label: 'Bring all to front');
					yourself);
				yourself);
			yourself);
		contentView: MarsPanel new;
		show