instance creation
memento: aMemento description: aDescription parent: aWidget
	^ self new
		memento: aMemento;
		description: aDescription;
		parent: aWidget;
		yourself