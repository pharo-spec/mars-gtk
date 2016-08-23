private
registerCallback: aCallback
	callbacks ifNil: [ callbacks := Set new ].
	callbacks add: aCallback