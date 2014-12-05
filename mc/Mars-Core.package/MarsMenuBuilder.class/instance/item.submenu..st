building
item: aString submenu: aBlock 
	items add: (MarsMenuSubmenu 
		label: aString 
		submenu: (MarsMenu new 
			addAll: (self collectItemsFrom: aBlock);
			yourself))