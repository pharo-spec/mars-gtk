private primitives
gtkMainIterationDo: blocking
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_main_iteration_do ( Boolean blocking ) )