private
getItemAt: position
	^ GtkListBoxRow newWidget: (GtkLabel newLabel: (self items at: position))