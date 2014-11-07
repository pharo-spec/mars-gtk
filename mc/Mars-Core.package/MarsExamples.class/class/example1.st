examples
example1
	"Shows a simple window with a panel inside (using vertical layout)"
	GtkToolkit useToolkit.
	MarsApplication new start.
	MarsWindow new 
		title: 'Test';
		bounds: (500@100 extent: 800@600);
		contentView: (MarsPanel new 
			addSubview: (MarsLabel new 
				text: 'Hello, World';
				yourself);
			addSubview: (MarsButton new
				label: 'Click me!';
				when: MarsClickAction do: [ UIManager default inform: 'OK!' ];
				yourself);
			yourself);
		show.