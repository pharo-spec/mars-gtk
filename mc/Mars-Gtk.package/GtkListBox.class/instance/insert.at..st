accessing
insert: aWidget at: position 
	| row |
	row := aWidget asListBoxRow.
	self keepWidget: row.
	self basicInsert: row at: position.
	^ row