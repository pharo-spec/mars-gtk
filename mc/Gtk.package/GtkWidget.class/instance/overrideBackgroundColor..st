as yet unclassified
overrideBackgroundColor: color
	| gtkColor |
	gtkColor := GdkRGBA new 
		red: color red;
		green: color green;
		blue: color blue;
		alpha: color alpha;
		yourself.
	^ self overrideBackgroundState: GTK_STATE_FLAG_SELECTED color: gtkColor