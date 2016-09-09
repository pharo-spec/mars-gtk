private building
buildWidget
	^ GtkBox newHorizontal
		packStart: (GtkBox newHorizontal 
				packStart: self buildLabelWidget padding: self class defaultLabelPadding;
				sizeRequest: self class defaultLabelWidth@(-1);
				yourself) 
			expand: false
			fill: false
			padding: 0;
		packStart: (editorWidget := (self magritteDescription isReadonly
			ifTrue: [ self buildViewWidget ]
			ifFalse: [ self buildEditorWidget ])); 
		yourself.
