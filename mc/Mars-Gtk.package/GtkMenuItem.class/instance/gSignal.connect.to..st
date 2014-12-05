private primitives
gSignal: instance connect: signalName to: callbackHandler 
	^ self 
		gSignal: instance 
		connect: signalName 
		to: callbackHandler 
		data: nil
		destroyData: nil
		flags: G_CONNECT_SWAPPED