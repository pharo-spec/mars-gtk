examples
example4
	"Show a menu bar using builder" 
	| window |
	GtkToolkit useToolkit.
	MarsApplication new start.
	(window := MarsWindow new) 
		title: 'Test';
		bounds: (500@100 extent: 800@600);
		menuBar: (MarsMenuBar make: [ :builder |
			builder 
				item: 'File' submenu: [
					builder 
						item: 'New' do: [ self inform: 'New pressed' ];
						item: 'Edit...' do: [ ];
						separator;
						item: 'Quit' do: [ window hide ] ];
				item: 'Edit' submenu: [
					builder 
						item: 	'Undo' do: [  ];
						item: 	'Redo' do: [  ] ];
				item: 'Window' submenu: [ 
					builder
						item: 'Minimize' do: [  ];
						item: 'Zoom' do: [  ];
						separator;
						item: 'Bring All to Front' do: [  ] ] ]);
		contentView: MarsPanel new;
		show