private signaling
connect: aString signature: signature do: aBlock
	"BEWARE when installing callbacks to gtk... you HAVE TO catch and fork any error happening, 
	 otherwise you will crash your image (event processing happens in VM event loop, so is fragile)"
	| callback |
	callback := FFICallback signature: signature block: aBlock.
	self registerCallback: callback.
	self signal: aString connect: callback data: nil