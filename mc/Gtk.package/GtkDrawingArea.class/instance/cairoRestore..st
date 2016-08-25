private
cairoRestore: cr
	^ self ffiCall: #(void cairo_restore (void *cr)) module: CairoLibrary