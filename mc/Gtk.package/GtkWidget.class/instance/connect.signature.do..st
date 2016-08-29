private signaling
connect: aString signature: signature do: aBlock
	| callback |
	callback := FFICallback signature: signature block: aBlock.
	self registerCallback: callback.
	self signal: aString connect: callback data: nil