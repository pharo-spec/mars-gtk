private
path
	| length path pathReversed |
	
	length := ExternalAddress new.
	path := ExternalAddress new.
	pathReversed := ExternalAddress new.
	
	self widgetPathLength: length path: path reversed: pathReversed.
	
	^ path readString