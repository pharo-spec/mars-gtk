Class {
	#name : #GListModelInterface,
	#superclass : #GtkStructure,
	#instVars : [
		'get_item_type',
		'get_n_items',
		'get_item'
	],
	#classVars : [
		'OFFSET_GET_ITEM',
		'OFFSET_GET_ITEM_TYPE',
		'OFFSET_GET_N_ITEMS',
		'OFFSET_G_IFACE'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'field definition' }
GListModelInterface class >> fieldsDesc [
	"self rebuildFieldAccessors"
	^ #(
	GTypeInterface 	g_iface;
  	"GType     (* get_item_type)   (GListModel *list);"
	#GCallback		get_item_type;
  	"guint     (* get_n_items)     (GListModel *list);"
	#GCallback 		get_n_items;
  	"gpointer  (* get_item)        (GListModel *list, guint position);"
	#GCallback		get_item;
	)
]

{ #category : #private }
GListModelInterface class >> rebuildFieldAccessors [
	"Prevent rebuild because I modify setters to keep callbacks (to prevent them to be GCed)"
]

{ #category : #'accessing structure variables' }
GListModelInterface >> g_iface [
	"This method was automatically generated"
	^ GTypeInterface fromHandle: (handle referenceStructAt: OFFSET_G_IFACE length: GTypeInterface byteSize)
]

{ #category : #'accessing structure variables' }
GListModelInterface >> g_iface: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_G_IFACE put: anObject getHandle length: GTypeInterface byteSize
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_item [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ITEM) asInteger)
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_item: aCallback [
	
	get_item := aCallback.
	handle 
		pointerAt: OFFSET_GET_ITEM
		put: (aCallback 
			ifNotNil: [ ExternalAddress fromAddress: aCallback thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_item_type [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ITEM_TYPE) asInteger)
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_item_type: aCallback [

	get_item_type := aCallback.
	handle 
		pointerAt: OFFSET_GET_ITEM_TYPE
		put: (aCallback 
			ifNotNil: [ ExternalAddress fromAddress: aCallback thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_n_items [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_N_ITEMS) asInteger)
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_n_items: aCallback [

	get_n_items := aCallback.
	handle 
		pointerAt: OFFSET_GET_N_ITEMS
		put: (aCallback 
			ifNotNil: [ ExternalAddress fromAddress: aCallback thunk address ]
			ifNil: [ ExternalAddress null ])
]
