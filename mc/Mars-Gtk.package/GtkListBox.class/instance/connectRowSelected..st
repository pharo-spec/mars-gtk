signaling
connectRowSelected: aBlock
	self 
		connect: 'row-selected' 
		signature: #(void (void *box, void *row, void *user_data))
		do: [ :box :row :user_data | 
			[ aBlock value: (self findChildByHandle: row) ] fork ]