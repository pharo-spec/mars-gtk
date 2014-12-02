private
collectSubviewHandlesFromHandle: aHandle
	"A support method to collect subviews from containers (in mars, we keep them so it should not 
	 be necesary to use them in regular applications)"
	| callback handles |
	
	handles := Set new.
	callback := GtkPointerPointerRetVoidCallback on: [ :handle :data | handles add: handle ].
	self 
		gtkContainer: aHandle 
		foreach: callback trunk 
		data: nil.
	
	^ handles 