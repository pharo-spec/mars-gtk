accessing
remove: widget
	"remove widgets will also destroy them (since it will not be referenced, unless you 
	 took a reference explicitly, which we are not doing now). 
	 See https://developer.gnome.org/gtk3/stable/GtkContainer.html#gtk-container-remove"
	self basicRemove: widget.
	children := children copyWithout: widget.
	"widget autoRelease" 