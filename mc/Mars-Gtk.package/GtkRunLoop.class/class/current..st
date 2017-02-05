accessing
current: aRunLoop
	current ifNotNil: [ current stop ].
	current := aRunLoop