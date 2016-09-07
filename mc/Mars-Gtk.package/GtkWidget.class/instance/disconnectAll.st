signaling
disconnectAll
	callbacks ifNil: [ ^ self ].
	callbacks copy do: [ :each | 
		self assert: (self disconnectByFunc: each) ~= 0.
		callbacks remove: each ].
	