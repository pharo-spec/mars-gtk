private
bindModel: aListModel
	self ffiCall: #(void gtk_list_box_bind_model (
		self,
		GListModelInterface *aListModel,
		"GtkListBoxCreateWidgetFunc create_widget_func" 0,
		"gpointer user_data" 0,
		"GDestroyNotify user_data_free_func" 0))