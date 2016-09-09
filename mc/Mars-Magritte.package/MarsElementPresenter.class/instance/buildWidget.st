private building
buildWidget
	^ GtkBox newHorizontal
		packStart: (self buildLabelWidget sizeRequest: self class defaultLabelWidth@(-1)) 
			expand: false
			fill: false
			padding: 0;
		packStart: (editorWidget := (self magritteDescription isReadonly
			ifTrue: [ self buildViewWidget ]
			ifFalse: [ self buildEditorWidget ])); 
		yourself.
