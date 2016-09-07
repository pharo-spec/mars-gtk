private signaling
connect: aString do: aBlock
	"this is the basic signaling (for IO events), who share signature along them... of course 
	 this is not correct in all cases (like for example 'draw'), then you need to use the method
	 #connect:signature:do:
	 BEWARE when installing callbacks to gtk... you HAVE TO catch and fork any error happening, 
	 otherwise you will crash your image (event processing happens in VM event loop, so is fragile)"
	^ self 
		connect: aString 
		signature: #(void (void *widget, void *aData))  
 		do: [ :widget :aData | [ aBlock value ] fork ]