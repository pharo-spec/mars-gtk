drawing
drawOnAthensCanvas: aCanvas
	"just forward to the morph"
	mutex critical: [ 	
		[ 
			aCanvas surface drawDuring: [ :theCanvas |
			morph fullDrawOnAthensCanvas: theCanvas ] ]
		on: Error do: [ :e | "just log for now" e crLog ] ]