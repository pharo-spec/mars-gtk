private
collectItemsFrom: aBlock
	| result oldItems |
	oldItems := items.
	items := OrderedCollection new.
	aBlock ensure: [ 
		result := items.
		items := oldItems ].
	^ result