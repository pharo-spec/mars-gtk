private signaling
disconnectMatchedMask: mask signal: signal_id detail: detail closure: closure func: func data: aData
	^ self ffiCall: #(guint g_signal_handlers_disconnect_matched (
		self,
		GSignalMatchType mask,
		guint signal_id,
		GQuark detail,
		"GClosure *" void *closure,
		FFICallback func,
      gpointer aData))