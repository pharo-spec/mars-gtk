running
setUp 
	super setUp.
	oldToolkit := MarsToolkit current.
	self class toolkitClass useToolkit.
