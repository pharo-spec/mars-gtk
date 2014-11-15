accessing
submenu: anObject
	submenu ifNotNil: [ submenu removeFromSuperview ].
	submenu := anObject.
	submenu appendTo: self