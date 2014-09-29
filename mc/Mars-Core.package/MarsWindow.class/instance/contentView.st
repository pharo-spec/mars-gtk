accessing
contentView
	^ contentView ifNil: [ contentView := self defaultContentView ]