running
stop 
	[ self closeAllWindows.
	  self platformApplication stop ]
	ensure: [ Current := nil ].