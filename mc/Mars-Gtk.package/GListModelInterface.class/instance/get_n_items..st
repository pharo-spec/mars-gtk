accessing structure variables
get_n_items: aCallback
	get_n_items := aCallback.
	handle unsignedLongAt: 13 put: aCallback thunk address