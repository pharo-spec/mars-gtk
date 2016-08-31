*Mars-Gtk
fromHandle: aHandle
	| target |
	handle := aHandle.
	"#getTarget will create a surface, but it will not initialize it, so we do it"
	target := (self getTarget) fromCanvas: self. 
	self surface: target.
	self initializeWithSurface: target