running
setUp 
	super setUp.
	oldToolkit := MarsToolkit current.
	GtkToolkit useToolkit.
