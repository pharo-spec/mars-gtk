private
itemAt: position
	^ GtkListBoxRow newWidget: (GtkLabel newLabel: (self items at: position))