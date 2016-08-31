accessing
addAll: aCollection
	aCollection do: [ :each | self basicAdd: each ].
	widgets := widgets copyWithAll: aCollection