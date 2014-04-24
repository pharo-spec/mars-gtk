private
current: anApplication 
	Current ifNotNil: [ self reset ].
	Current := anApplication.