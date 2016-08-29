*Gtk-Glamour
gtkToolbarButton
	^ (GtkToolButton newIcon: (GtkImage newForm: self icon) label: self title)
		connectClicked: self action;
		yourself