examples
example3
	"Show a menu bar"
	| window |
	GtkToolkit useToolkit.
	MarsApplication new start.
	(window := MarsWindow new) 
		title: 'Test';
		bounds: (500@100 extent: 800@600);
		menuBar: (MarsMenuBar new 
			add: ((MarsMenuSubmenu label: 'File')
				submenu: (MarsMenu new 
					add: (MarsMenuItem label: 'New' action: [ self inform: 'New pressed!' ]);
					add: (MarsMenuItem label: 'Open...' action: [ self inform: 'Open pressed!' ]);
					add: MarsMenuSeparator new;	
					add: (((MarsMenuItem label: 'Exit' action: [ window hide ]))
						shortcut: $q command;
						yourself);
					yourself);
				yourself);
			add: ((MarsMenuSubmenu label: 'Edit')
				submenu: (MarsMenu new 
					add: (MarsMenuItem label: 'Undo');
					add: (MarsMenuItem label: 'Redo');	
					yourself);
				yourself);
			add: ((MarsMenuSubmenu label: 'Window')
				submenu: (MarsMenu new 
					add: (MarsMenuItem label: 'Minimize');
					add: (MarsMenuItem label: 'Zoom');	
					add: MarsMenuSeparator new;	
					add: (MarsMenuItem label: 'Bring all to front');
					yourself);
				yourself);
			yourself);
		contentView: MarsPanel new;
		show