"
GtkCellLayout — An interface for packing cells

https://developer.gnome.org/gtk3/stable/GtkCellLayout.html
"
Trait {
	#name : #TGtkCellLayout,
	#category : #'Mars-Gtk-Widget'
}

{ #category : #private }
TGtkCellLayout >> cellLayoutAddAttribute: cell attribute: attribute column: column [

	self ffiCall: #(void gtk_cell_layout_add_attribute (self,
		GtkCellRenderer *cell,
		const gchar *attribute,
 		gint column))
]

{ #category : #private }
TGtkCellLayout >> cellLayoutPackStart: cell expand: expand [

	self ffiCall: #(void gtk_cell_layout_pack_start (self, GtkCellRenderer *cell, gboolean expand))
]
