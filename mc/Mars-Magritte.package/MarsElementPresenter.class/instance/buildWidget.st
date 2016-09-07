private building
buildWidget
	^ GtkBox newHorizontal
		packStart: (self buildLabelWidget sizeRequest: self class defaultLabelWidth@ -1) 
			expand: false
			fill: true 
			padding: 0;
		packStart: (self magritteDescription isReadonly
			ifTrue: [ self buildViewWidget ]
			ifFalse: [ self buildEditorWidget ]); 
		yourself.
