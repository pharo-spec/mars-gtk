"
A GtkWindow can be one of these types. Most things you’d consider a “window” should have type GTK_WINDOW_TOPLEVEL; windows with this type are managed by the window manager and have a frame by default (call gtk_window_set_decorated() to toggle the frame). Windows with type GTK_WINDOW_POPUP are ignored by the window manager; window manager keybindings won’t work on them, the window manager won’t decorate the window with a frame, many GTK+ features that rely on the window manager will not work (e.g. resize grips and maximization/minimization). GTK_WINDOW_POPUP is used to implement widgets such as GtkMenu or tooltips that you normally don’t think of as windows per se. Nearly all windows should be GTK_WINDOW_TOPLEVEL. In particular, do not use GTK_WINDOW_POPUP just to turn off the window borders; use gtk_window_set_decorated() for that.

https://developer.gnome.org/gtk3/stable/GtkWindow.html#GtkWindowType
"
Class {
	#name : #GtkWindowType,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'GTK_WINDOW_POPUP',
		'GTK_WINDOW_TOPLEVEL'
	],
	#category : 'Mars-Gtk-Container'
}

{ #category : #'enum declaration' }
GtkWindowType class >> enumDecl [
	^ #(
	GTK_WINDOW_TOPLEVEL 0
	GTK_WINDOW_POPUP 1
	)
]
