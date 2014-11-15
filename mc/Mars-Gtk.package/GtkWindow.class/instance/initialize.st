initialization
initialize 
	super initialize.
	contentLayout := GtkVerticalBoxLayout new.
	contentHandle := contentLayout createLayout.
	self gtkContainer: self handle add: contentHandle
	