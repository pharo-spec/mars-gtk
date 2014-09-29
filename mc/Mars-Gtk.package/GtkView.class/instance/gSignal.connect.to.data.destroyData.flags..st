private primitives
gSignal: instance connect: signalName to: callbackHandler data: data destroyData: destroyData flags: connectFlags
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self 
		nbCall: #( ulong g_signal_connect_data (
			"gpointer" 			void *instance,
			"const gchar *" 	String signalName,
			"GCallback" 			void *callbackHandler,
			"gpointer" 			void *data,
			"GClosureNotify" 	void *destroyData,
			"GConnectFlags" 	uint connectFlags) )
		options: #( optCoerceNilToNull )