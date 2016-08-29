examples
exampleStacker
	<example>
	
	| browser |
	
	browser := GLMStacker new
		title: 'Example Stacker';
		initialExtent: 400@400;
		yourself.
	GtkRenderer useDuring: [ browser openOn: Object new ]
	