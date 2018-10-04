Class {
	#name : #GListModelInterface,
	#superclass : #GtkStructure,
	#instVars : [
		'get_item_type',
		'get_n_items',
		'get_item'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'field definition' }
GListModelInterface class >> fieldsDesc [
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
]

{ #category : #private }
GListModelInterface class >> rebuildFieldAccessors [
	"Prevent rebuild because I modify setters to keep callbacks (to prevent them to be GCed)"
]

{ #category : #'accessing structure variables' }
GListModelInterface >> g_iface [
	"This method was automatically generated"
	^GTypeInterface fromHandle: (handle referenceStructAt: 1 length: 8)
]

{ #category : #'accessing structure variables' }
GListModelInterface >> g_iface: anObject [
	"This method was automatically generated"
	handle structAt: 1 put: anObject getHandle length: 8.
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_item [
	"This method was automatically generated"
	^FFICallback forAddress: (handle unsignedLongAt: 17)
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_item: aCallback [
	get_item := aCallback.
	handle unsignedLongAt: 17 put: aCallback thunk address
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_item_type [
	"This method was automatically generated"
	^FFICallback forAddress: (handle unsignedLongAt: 9)
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_item_type: aCallback [
	get_item_type := aCallback.
	handle unsignedLongAt: 9 put: aCallback thunk address
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_n_items [
	"This method was automatically generated"
	^FFICallback forAddress: (handle unsignedLongAt: 13)
]

{ #category : #'accessing structure variables' }
GListModelInterface >> get_n_items: aCallback [
	get_n_items := aCallback.
	handle unsignedLongAt: 13 put: aCallback thunk address
]
