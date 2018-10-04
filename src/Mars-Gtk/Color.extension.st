Extension { #name : #Color }

{ #category : #'*Mars-Gtk' }
Color >> gtkRGBA [
	^ GdkRGBA new 
		red: self red;
		green: self green;
		blue: self blue;
		alpha: self alpha;
		yourself
]
