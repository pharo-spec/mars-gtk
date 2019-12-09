"
I'm a list container.

https://developer.gnome.org/gtk3/stable/GtkListBox.html
"
Class {
	#name : #GtkListBox,
	#superclass : #GtkContainer,
	#instVars : [
		'listModel'
	],
	#pools : [
		'GtkSelectionMode'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #accessing }
GtkListBox class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_list_box_get_type())
]

{ #category : #private }
GtkListBox class >> listBoxNew [
	^ self ffiCall: #(GtkListBox *gtk_list_box_new (void))
]

{ #category : #'instance creation' }
GtkListBox class >> new [
	^ self listBoxNew initialize
]

{ #category : #accessing }
GtkListBox >> activateOnSingleClick: single [

	self ffiCall: #(void gtk_list_box_set_activate_on_single_click (self, gboolean single))
]

{ #category : #accessing }
GtkListBox >> add: aWidget [ 
	^ super add: aWidget asListBoxRow
]

{ #category : #private }
GtkListBox >> basicInsert: child at: position [
	self ffiCall: #(void gtk_list_box_insert (self, GtkWidget *child, gint position))
]

{ #category : #configuring }
GtkListBox >> beMultipleSelectionMode [

	self selectionMode: GTK_SELECTION_MULTIPLE
]

{ #category : #configuring }
GtkListBox >> beSingleSelectionMode [

	self selectionMode: GTK_SELECTION_SINGLE
]

{ #category : #private }
GtkListBox >> bindModel: aListModel [
	
	self ffiCall: #(void gtk_list_box_bind_model (
		self,
		GListModelInterface *aListModel,
		"GtkListBoxCreateWidgetFunc create_widget_func" NULL,
		"gpointer user_data" NULL,
		"GDestroyNotify user_data_free_func" NULL))
]

{ #category : #signaling }
GtkListBox >> connectRowActivated: aBlock [ 
	
	^ (GListBoxRowActivatedCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkListBox >> connectRowSelected: aBlock [

	self 
		connect: 'row-selected' 
		signature: #(void (void *box, void *row, void *user_data))
		do: [ :box :row :user_data | aBlock value: (self findChildByHandle: row) ]
]

{ #category : #signaling }
GtkListBox >> connectSelectedRowsChanged: aBlock [

	self 
		connect: 'selected-rows-changed' 
		signature: #(void (void *box, void *user_data))
		do: [ :box :user_data | aBlock value ]
]

{ #category : #accessing }
GtkListBox >> getRowAtY: y [

	self ffiCall: #(GtkListBoxRow *gtk_list_box_get_row_at_y (self, gint y))
]

{ #category : #private }
GtkListBox >> getSelectedRow [
	"Answer void* because I use it as address, to find the row I already have, and I do not want 
	 to create a duplicated row."
	^ self ffiCall: #("GtkListBoxRow *" void *gtk_list_box_get_selected_row (self))
]

{ #category : #private }
GtkListBox >> getSelectedRows [

	^ self ffiCall: #("GList *"void *gtk_list_box_get_selected_rows (self))
]

{ #category : #accessing }
GtkListBox >> insert: aWidget at: position [ 
	| row |
	row := aWidget asListBoxRow.
	self keepWidget: row.
	self basicInsert: row at: position.
	^ row
]

{ #category : #accessing }
GtkListBox >> isActivateOnSingleClick [

	^ self ffiCall: #(gboolean gtk_list_box_get_activate_on_single_click (self))
]

{ #category : #convenience }
GtkListBox >> items [

	^ self children
]

{ #category : #accessing }
GtkListBox >> listModel: aListModel [

	listModel := aListModel. 
	self bindModel: aListModel interface
]

{ #category : #accessing }
GtkListBox >> prependWidget: aWidget [
	self
		ffiCall: #(void gtk_list_box_prepend #(self , GtkWidget * aWidget))
]

{ #category : #accessing }
GtkListBox >> selectIndex: rowIndex [
	"WARNING: Since this is exclusive pharo-side, indexes are one-based"

	(self children at: rowIndex ifAbsent: [ nil ]) 
		ifNotNil: [ :row | self selectRow: row ]
]

{ #category : #accessing }
GtkListBox >> selectRow: row [

	self ffiCall: #(void gtk_list_box_select_row (self, GtkListBoxRow *row))
]

{ #category : #accessing }
GtkListBox >> selectedIndexes [
	"WARNING: Since this is exclusive pharo-side, indexes are one-based"

	^ self selectedRows
		collect: [ :each | self children indexOf: each ]
]

{ #category : #accessing }
GtkListBox >> selectedRow [

	^ self findChildByHandle: self getSelectedRow
]

{ #category : #accessing }
GtkListBox >> selectedRows [
	| gList handles |
	
	handles := Array new writeStream.
	gList := (GList fromHandle: self getSelectedRows) autoRelease.
	[ gList getHandle isNull ] 
	whileFalse: [ 
		handles nextPut: gList data.	
		gList := gList next ].
	
	^ handles contents collect: [ :each | self findChildByHandle: each ]
]

{ #category : #private }
GtkListBox >> selectionMode: mode [

	self ffiCall: #(void gtk_list_box_set_selection_mode (self, GtkSelectionMode mode))
]

{ #category : #accessing }
GtkListBox >> unselectAll [
	self ffiCall: #(void gtk_list_box_unselect_all (self))
]

{ #category : #accessing }
GtkListBox >> unselectRow: row [
	self ffiCall: #(void gtk_list_box_unselect_row (self, GtkListBoxRow *row))
]
