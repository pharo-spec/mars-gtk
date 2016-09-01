accessing
removeAll
	children do: [ :each | self basicRemove: each ].
	children := #()