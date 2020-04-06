Extension { #name : #Rectangle }

{ #category : #'*Mars-Gtk' }
Rectangle >> asGdkRectangle [

	^ GdkRectangle new 
		x: self left;
		y: self top;
		width: self width;
		height: self height
]
