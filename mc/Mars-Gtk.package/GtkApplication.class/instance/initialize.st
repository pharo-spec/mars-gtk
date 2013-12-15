initialization
initialize 
	super initialize.
	runLoop := GtkRunLoop new.
	
	"Initialize Gtk3"
	self gtkInit.