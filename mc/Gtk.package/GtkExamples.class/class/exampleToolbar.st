examples
exampleToolbar
	<example>
	
	GtkApplication new run.
	GtkWindow new 
		autoRelease;
		title: 'Toolbar example';
		resize: 500@200;
		add: (GtkBox newVertical
			packStart: (GtkToolbar new
					beIconSizeSmallToolbar;
					beIcons; "beIcons, beText, beBoth"
					add: (GtkToolButton newIcon: (GtkImage newStock: 'gtk-ok') label: 'Ok');
					add: (GtkToolButton newIcon: (GtkImage newStock: 'gtk-cancel') label: 'Cancel');
					yourself)
				expand: false 
				fill: false 
				padding: 5;
			packStart: (GtkLabel newLabel: 'panel');
			yourself);
		center;
		show;
		inspect