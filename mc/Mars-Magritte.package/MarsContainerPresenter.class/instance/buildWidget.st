private building
buildWidget
	| newWidget |
	newWidget := GtkBox newVertical.
	self children do: [ :each | 
		newWidget 
			packStart: each widget 
			expand: false 
			fill: true 
			padding: self class defaultChildPadding ].
	^ newWidget