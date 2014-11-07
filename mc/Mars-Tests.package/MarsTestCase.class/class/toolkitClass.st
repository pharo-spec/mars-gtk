accessing
toolkitClass 
	^ ToolkitClass ifNil: [ ToolkitClass := MarsToolkit suitableToolkit ]