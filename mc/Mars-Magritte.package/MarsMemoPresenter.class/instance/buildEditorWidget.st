private building
buildEditorWidget
	^ GtkScrolledWindow new 
		add: (GtkTextView new text: self string);
		sizeRequest: -1@(self magritteDescription lineCount * self class defaultLineHeight);
		borderWidth: self class defaultBorderWidth;
		yourself