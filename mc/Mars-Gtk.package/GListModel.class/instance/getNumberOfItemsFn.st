private
getNumberOfItemsFn
	^ FFICallback 
		signature: #(uint (void *list)) 
		block: [ :list | self getNumberOfItems ]