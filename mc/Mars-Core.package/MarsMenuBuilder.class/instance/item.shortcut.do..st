building
item: aString shortcut: aShortcut do: aBlock 
	items add: ((MarsMenuItem label: aString action: aBlock)
		shortcut: aShortcut;
		yourself)