private building
buildWidgetOn: aContainer
	^ (GtkButton newLabel: self label)
		in: [ :this | 
			self icon ifNotNil: [ 
				this 
					alwaysShowImage: true;
					image: (GtkImage newForm: self icon) ] ];
		connectClicked: [ self action value: aContainer ];
		yourself