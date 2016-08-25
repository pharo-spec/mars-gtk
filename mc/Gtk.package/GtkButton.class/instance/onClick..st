as yet unclassified
onClick: aBlock
	self 
		connect: 'clicked' 
		signature: #(void (void *widget, void * data))  
		do: [ :widget :data | aBlock value ]