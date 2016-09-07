private signaling
disconnectByFunc: func
	^ self 
		disconnectMatchedMask: G_SIGNAL_MATCH_FUNC 
		signal: 0 
		detail: 0 
		closure: ExternalAddress null
		func: func 
		data: ExternalAddress null