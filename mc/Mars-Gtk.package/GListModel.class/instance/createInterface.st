private
createInterface
	^ GListModelInterface new 
		get_item: self getItemFn;
		get_n_items: self getNumberOfItemsFn;
		get_item_type: self getItemTypeFn;
		yourself