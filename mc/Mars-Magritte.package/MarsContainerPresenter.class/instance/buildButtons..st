private building
buildButtons: anArray
	| buttonsBox |
	buttonsBox := GtkBox newHorizontal.
	anArray do: [ :each | 
		buttonsBox packEnd: (each widgetOn: self) expand: false fill: false padding: 2  ].
	^ buttonsBox
	