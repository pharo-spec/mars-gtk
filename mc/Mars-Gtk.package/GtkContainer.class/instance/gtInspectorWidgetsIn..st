GT-Inspector-Extension
gtInspectorWidgetsIn: composite
	<gtInspectorPresentationOrder: 80>  
	composite tree 
		title: 'Widgets';
		rootsExpanded;
		display: [:each | {each} ];
		children: [:each | 
			(each isKindOf: GtkContainer) 
				ifTrue: [ each children ]
				ifFalse: [ nil ]];
		when: [:each | each hasChildren ]