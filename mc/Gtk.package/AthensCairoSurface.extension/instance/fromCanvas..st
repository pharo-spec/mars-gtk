*Gtk
fromCanvas: aCanvas
	session := Smalltalk session.
	id := self class registerSurface: self.
	context := aCanvas.
	builder := AthensCairoPathBuilder new.
	builder context: context.
	ftFontRenderer := CairoFreetypeFontRenderer new canvas: context