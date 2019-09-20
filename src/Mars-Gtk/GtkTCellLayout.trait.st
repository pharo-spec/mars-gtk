"
GtkCellLayout — An interface for packing cells

https://developer.gnome.org/gtk3/stable/GtkCellLayout.html
"
Trait {
	#name : #GtkTCellLayout,
	#category : #'Mars-Gtk-Widget'
}

{ #category : #private }
GtkTCellLayout >> addAttribute: attribute column: column renderer: cell [

	self ffiCall: #(void gtk_cell_layout_add_attribute (self,
		GtkCellRenderer *cell,
		const gchar *attribute,
 		gint column))
]

{ #category : #private }
GtkTCellLayout >> clear [

	self ffiCall: #(void gtk_cell_layout_clear (self))
]

{ #category : #private }
GtkTCellLayout >> packStart: cell [

	^ self packStart: cell expand: true
]

{ #category : #private }
GtkTCellLayout >> packStart: cell expand: expand [

	self ffiCall: #(void gtk_cell_layout_pack_start (self, GtkCellRenderer *cell, gboolean expand))
]
