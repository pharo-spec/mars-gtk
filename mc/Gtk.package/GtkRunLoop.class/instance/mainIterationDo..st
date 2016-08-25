private
mainIterationDo: blocking
	^ self ffiCall: #( void g_main_context_iteration ( 0, gboolean blocking ) )