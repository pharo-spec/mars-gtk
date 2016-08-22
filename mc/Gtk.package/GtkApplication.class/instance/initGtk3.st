private
initGtk3
	"Initialize Gtk3"
	initialized ifTrue: [ ^ self ].
	self flag: #todo. "This is a temporal hack to ensure library is found (I need to review the VM)."
	LibC loadLibrary: '/opt/local/lib/libgtk-3.dylib'. 
	self initArgC: 0 argV: 0.
	initialized := true