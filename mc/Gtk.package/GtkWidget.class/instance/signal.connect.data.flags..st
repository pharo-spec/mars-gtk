private
signal: signalName connect: callback data: data flags: connectFlags
	^ self ffiCall: #( gulong g_signal_connect_data ( 
		self,
		const gchar *signalName,
		GCallback callbackHandler,
		gpointer 	data,
		0,
		GConnectFlags connectFlags ) )
		