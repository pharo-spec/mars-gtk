accessing
contentView: anObject
	self assert: anObject notNil description: 'contentView cannot be nil!'.
	self platformView 
		updateContentViewFrom: (contentView ifNotNil: [ contentView platformView ]) 
		to: anObject platformView.
	contentView := anObject