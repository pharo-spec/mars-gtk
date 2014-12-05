I'm a builder used to easy the creation of menus. 
You can create complex menus doing something like: 

MarsMenuBar make: [ :builder |
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
			item: 'Bring All to Front' do: [  ] ] ]