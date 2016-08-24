drawing
drawOnAthensCanvas: aCanvas
	"just forward to the morph"
	morph extent: self getAllocatedWidth @ self getAllocatedHeight.
	aCanvas surface drawDuring: [ :theCanvas |
		morph fullDrawOnAthensCanvas: aCanvas ]