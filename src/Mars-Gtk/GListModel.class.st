Class {
	#name : #GListModel,
	#superclass : #Object,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#instVars : [
		'interface',
		'itemType'
	],
	#pools : [
		'GtkTypes'
	],
	#category : 'Mars-Gtk-Misc'
}

{ #category : #accessing }
GListModel class >> itemName [
	^ 'GtkWidget'
]

{ #category : #private }
GListModel >> createInterface [
	^ GListModelInterface new 
		get_item: self getItemFn;
		get_n_items: self getNumberOfItemsFn;
		get_item_type: self getItemTypeFn;
		yourself
]

{ #category : #private }
GListModel >> getItemFn [
	^ FFICallback 
		signature: #(void *(void *list, uint post)) 
		block: [ :list :pos | self itemAt: pos ]
]

{ #category : #private }
GListModel >> getItemTypeFn [
	^ FFICallback 
		signature: #(ulong (void *list)) 
		block: [ :list | self itemType ]
]

{ #category : #private }
GListModel >> getNumberOfItemsFn [
	^ FFICallback 
		signature: #(uint (void *list)) 
		block: [ :list | self numberOfItems ]
]

{ #category : #accessing }
GListModel >> interface [
	^ interface ifNil: [ interface := self createInterface ]
]

{ #category : #accessing }
GListModel >> itemAt: position [
	self subclassResponsibility
]

{ #category : #accessing }
GListModel >> itemType [
	^ itemType ifNil: [ itemType := self typeFromName: self class itemName ]
]

{ #category : #accessing }
GListModel >> numberOfItems [
	self subclassResponsibility
]

{ #category : #private }
GListModel >> typeFromName: name [
	^ self ffiCall: #(GType g_type_from_name (const gchar *name))
]
