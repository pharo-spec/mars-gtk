accessing
add: aWidget
	self children size ~= 0 
		ifTrue: [ GtkError signal: 'Bin container already contains a widget!' ].
	^ super add: aWidget