private
initGtk3
	"Initialize Gtk3"
	self flag: #todo. "This is a temporal hack to ensure library is found (I need to review the VM)."
	DynamicLoader loadLibrary: GtkLibrary uniqueInstance moduleName.  
	self initArgC: 0 argV: 0