private signaling
signal: aString connect: callback data: data
	^ self 
		signal: aString  
		connect: callback 
		data: data
		flags: G_CONNECT_NONE