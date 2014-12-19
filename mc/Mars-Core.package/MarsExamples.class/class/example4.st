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
						item: 'New' shortcut: $n command do: [ self inform: 'New pressed' ];
						item: 'Edit...' do: [ self inform: 'Edit pressed' ];
						separator;
						item: 'Quit' shortcut: $q command do: [ window hide ] ];
				item: 'Edit' submenu: [
					builder 
						item: 	'Undo' do: [ self inform: 'Undo pressed' ];
						item: 	'Redo' do: [ self inform: 'Redo pressed' ] ];
				item: 'Window' submenu: [ 
					builder
						item: 'Minimize' do: [ self inform: 'Minimize pressed' ];
						item: 'Zoom' do: [ self inform: 'Zoom pressed' ];
						separator;
						item: 'Bring All to Front' do: [ self inform: 'Bring All to Front pressed' ] ] ]);
		contentView: MarsPanel new;
		show