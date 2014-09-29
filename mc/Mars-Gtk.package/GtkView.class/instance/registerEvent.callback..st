event handling
registerEvent: eventName callback: callback
	callbacks add: callback.
	self 
		gSignal: self handle 
		connect: eventName 
		to: callback trunk