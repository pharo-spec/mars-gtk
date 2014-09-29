event handling
registerEvent: eventName do: aBlock
	self 
		registerEvent: eventName 
		callback: (GtkVoidVoidCallback on: aBlock)