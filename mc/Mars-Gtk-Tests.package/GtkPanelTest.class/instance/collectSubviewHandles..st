private
collectSubviewHandles: panel
	"A support method to collect subviews from panels (in mars, we keep them so it should not 
	 be necesary to use them in regular applications)"
	| callback handles |
	
	handles := Set new.
	callback := GtkPointerPointerRetVoidCallback on: [ :handle :data | handles add: handle ].
	self 
		gtkContainer: panel handle 
		foreach: callback trunk 
		data: nil.
	
	^ handles 