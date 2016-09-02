accessing
removeAll
	children do: [ :each | 
		each autoRelease.
		self basicRemove: each ].
	children := #()