accessing
insert: item at: pos
	"If pos is 0 the item is prepended to the start of the toolbar. 
	 If pos is negative, the item is appended to the end of the toolbar."
	^ self ffiCall: #(void gtk_toolbar_insert (self, GtkToolItem *item, gint pos))