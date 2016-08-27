as yet unclassified
overrideBackgroundColor: color
	^ self 
		overrideBackgroundState: GTK_STATE_FLAG_NORMAL 
		color: color gtkRGBA