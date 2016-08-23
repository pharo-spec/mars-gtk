*Gtk
fromHandle: aHandle
	| target |
	handle := aHandle.
	target := self getTarget.
	self surface: target.
	self initializeWithSurface: target