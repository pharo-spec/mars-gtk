accessing
removeAll
	widgets do: [ :each | self basicRemove: each ].
	widgets := #()