field definition
fieldsDesc
	"self rebuildFieldAccessors"
	^ #(
	GTypeInterface 	g_iface;
  	"GType     (* get_item_type)   (GListModel *list);"
	FFICallback		get_item_type;
  	"guint     (* get_n_items)     (GListModel *list);"
	FFICallback 		get_n_items;
  	"gpointer  (* get_item)        (GListModel *list, guint position);"
	FFICallback		get_item;
	)