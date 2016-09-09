external resource management
autoRelease
	"autoReleasing windows is more complicated than the usual WeakRegistry mechanism, since 
	 I can have strong references to self in callbacks (due to the events registered). 
	 Therefore, I need a better mechanism and this is well handled by EphemeronRegistry. 
	 This will call the regular #finalize method from this object"
	GtkWindowRegistry at: self put: nil