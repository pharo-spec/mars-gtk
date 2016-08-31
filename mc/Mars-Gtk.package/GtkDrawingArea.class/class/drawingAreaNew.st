private
drawingAreaNew
	^ self ffiCall: #( GtkDrawingArea *gtk_drawing_area_new () )