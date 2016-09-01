accessing
addAll: aCollection
	aCollection do: [ :each | self basicAdd: each ].
	children := children copyWithAll: aCollection