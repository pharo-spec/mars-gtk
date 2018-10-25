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
	#category : 'Mars-Gtk-Widget'
}

{ #category : #private }
GtkListBox class >> listBoxNew [
	^ self ffiCall: #(GtkListBox *gtk_list_box_new (void))
]

{ #category : #'instance creation' }
GtkListBox class >> new [
	^ self listBoxNew initialize
]

{ #category : #accessing }
GtkListBox >> add: aWidget [ 
	^ super add: aWidget asListBoxRow
]

{ #category : #private }
GtkListBox >> basicInsert: child at: position [
	self ffiCall: #(void gtk_list_box_insert (self, GtkWidget *child, gint position))
]

{ #category : #private }
GtkListBox >> basicSelectedRow [
	"Answer void* because I use it as address, to find the row I already have"
	^ self ffiCall: #("GtkListBoxRow *" void *gtk_list_box_get_selected_row (self))
]

{ #category : #private }
GtkListBox >> bindModel: aListModel [
	self ffiCall: #(void gtk_list_box_bind_model (
		self,
		GListModelInterface *aListModel,
		"GtkListBoxCreateWidgetFunc create_widget_func" 0,
		"gpointer user_data" 0,
		"GDestroyNotify user_data_free_func" 0))
]

{ #category : #signaling }
GtkListBox >> connectRowSelected: aBlock [

	self 
		connect: 'row-selected' 
		signature: #(void (void *box, void *row, void *user_data))
		do: [ :box :row :user_data | 
			[ aBlock value: (self findChildByHandle: row) ] fork ]
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
GtkListBox >> listModel: aListModel [
	listModel := aListModel. 
	self bindModel: aListModel interface
]

{ #category : #accessing }
GtkListBox >> selectRow: aRow [
	self ffiCall: #(void gtk_list_box_select_row (self, GtkListBoxRow *row))
]

{ #category : #accessing }
GtkListBox >> selectedRow [
	^ self findChildByHandle: self basicSelectedRow
]

{ #category : #accessing }
GtkListBox >> unselectAll [
	self ffiCall: #(void gtk_list_box_unselect_all (self))
]

{ #category : #accessing }
GtkListBox >> unselectRow: row [
	self ffiCall: #(void gtk_list_box_unselect_row (self, GtkListBoxRow *row))
]
