accessing
installShortcutOn: gtkWindow
	| shortcut |
	shortcut := self view shortcut.
	shortcut ifNil: [ ^ self ].
	self gtkWidgetAddAccelerator: self handle 
		signal: 'activate' 
		group: gtkWindow accelGroupHandle
		key: shortcut character key asciiValue
		modifiers: (shortcut modifier gtkModifier: self class)
		flags: GTK_ACCEL_VISIBLE