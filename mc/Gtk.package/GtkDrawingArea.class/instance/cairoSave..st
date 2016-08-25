private
cairoSave: cr
	^ self ffiCall: #(void cairo_save (void *cr)) module: CairoLibrary