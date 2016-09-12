private building
buildEditorWidget
	^ GtkScrolledWindow new 
		sizeRequest: -1@(self magritteDescription lineCount * self class defaultLineHeight);
		borderWidth: self class defaultBorderWidth;
		add: (innerEditorWidget := GtkTextView new text: self string);
		yourself