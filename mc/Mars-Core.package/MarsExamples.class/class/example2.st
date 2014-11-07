examples
example2
	"Show a simple window with a panel inside (using horizontal layout). 
	 Show also a window composed by two panels"
	GtkToolkit useToolkit.
	MarsApplication new start.
	MarsWindow new 
		title: 'Test';
		bounds: (500@100 extent: 800@600);
		contentView: (MarsPanel new 
			layout: MarsHorizontalLayout new; 
			addSubview: (MarsLabel new 
				text: 'Hello, World';
				yourself);
			addSubview: (MarsPanel new
				addSubview: (MarsButton new
					label: 'Click me!';
					when: MarsClickAction do: [ UIManager default inform: 'Click 1!' ];
					yourself); 
				addSubview: (MarsButton new
					label: 'Or click me!';
					when: MarsClickAction do: [ UIManager default inform: 'Click 2!' ];
					yourself); 					
				yourself);
			yourself);
		show.