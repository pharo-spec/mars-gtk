accessing
itemType
	^ itemType ifNil: [ itemType := self typeFromName: self class itemName ]