private
imageNewFromStock: stock_id
	^ self ffiCall: #(GtkImage *gtk_image_new_from_stock (const gchar *stock_id))