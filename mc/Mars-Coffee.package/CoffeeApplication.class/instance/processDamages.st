private
processDamages
	self hasDamages ifFalse: [ ^ self ].
	damagedViews reset.