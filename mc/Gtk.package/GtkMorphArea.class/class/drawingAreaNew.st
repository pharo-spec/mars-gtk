private
drawingAreaNew
	^ self ffiCall: #( GtkMorphArea *gtk_drawing_area_new () )