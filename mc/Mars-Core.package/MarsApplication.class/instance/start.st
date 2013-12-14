running
start 
	Current ifNotNil: [ Current stop ].
	Current := self.
	self platformApplication start.
	