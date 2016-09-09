private building
buildEditorWidget
	^ GtkListBox new 
		sizeRequest: -1@(self class defaultLineHeight * self class defaultOptionsCount);
		addAll: (self options collect: [ :object | self buildLabelFor: object]);
		yourself