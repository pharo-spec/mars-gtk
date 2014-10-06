event handling
registerEvent: eventName do: aBlock
	self 
		registerEvent: eventName 
		callback: (GtkVoidRetVoidCallback on: aBlock)