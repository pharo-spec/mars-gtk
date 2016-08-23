drawing
drawOnAthensCanvas: aCanvas
	[ morph drawOnAthensCanvas: aCanvas ]
	on: Error fork: [ :e | e debug ]