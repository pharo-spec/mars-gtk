running
run
	Current ifNotNil: [ Current stop ].
	Current := nil.
	self start.
	Current := self.
	