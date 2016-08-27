accessing
append: child label: label
	pages at: label put: child.
	self appendPageChild: child label: label	