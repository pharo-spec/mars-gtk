private signaling
connect: aString do: aBlock
	"this is the basic signaling (for IO events), who share signature along them... of course 
	 this is not correct in all cases (like for example 'draw'), then you need to use the method
	 #connect:signature:do:"
	^ self 
		connect: aString 
		signature: #(void (void *widget, void * data))  
 		do: [ :widget :data | aBlock value ]