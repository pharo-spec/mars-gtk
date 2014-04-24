running
stop 
	[ self hideAllWindows.
	  self platformApplication stop ]
	ensure: [ Current := nil ].