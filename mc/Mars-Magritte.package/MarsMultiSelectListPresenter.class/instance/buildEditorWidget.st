private building
buildEditorWidget
	^ GtkScrolledWindow new 
		sizeRequest: -1@(self class defaultLineHeight * self class defaultOptionsCount);
		borderWidth: self class defaultBorderWidth;		
		add: (GtkListBox new 
			addAll: (self options collect: [ :object | self buildLabelFor: object]);
			yourself);
		yourself