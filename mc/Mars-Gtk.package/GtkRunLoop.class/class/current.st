accessing
current
	^ current ifNil: [ current := self defaultRunLoopClass uniqueInstance ]