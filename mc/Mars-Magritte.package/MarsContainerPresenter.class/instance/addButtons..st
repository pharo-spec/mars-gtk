accessing
addButtons: anArray
	self widget 
		packEnd: (self buildButtons: anArray) 
		expand: false 
		fill: false 
		padding: 0