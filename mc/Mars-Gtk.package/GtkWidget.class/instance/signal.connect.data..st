private signaling
signal: aString connect: callback data: aData
	^ self 
		signal: aString  
		connect: callback 
		data: aData
		flags: G_CONNECT_NONE