private
getItemFn
	^ FFICallback 
		signature: #(void *(void *list, uint post)) 
		block: [ :list :pos | self getItemAt: pos ]