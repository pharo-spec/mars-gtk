private
getItemTypeFn
	^ FFICallback 
		signature: #(ulong (void *list)) 
		block: [ :list | self getItemType ]