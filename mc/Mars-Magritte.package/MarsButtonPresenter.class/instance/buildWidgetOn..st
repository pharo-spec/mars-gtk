private building
buildWidgetOn: aContainer
	| newButton |
	
	newButton := GtkButton newLabel: self label.
	newButton connectClicked: [ self action value: aContainer ].
	self icon ifNotNil: [ 
		newButton
			alwaysShowImage: true;
			image: (GtkImage newForm: self icon) ].

	^ newButton