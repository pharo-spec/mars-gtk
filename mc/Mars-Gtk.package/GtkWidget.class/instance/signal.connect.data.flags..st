private signaling
signal: signalName connect: callback data: aData flags: connectFlags
	^ self ffiCall: #( gulong g_signal_connect_data ( 
		self,
		const gchar *signalName,
		GCallback callback,
		gpointer 	aData,
		0,
		GConnectFlags connectFlags ) )
		