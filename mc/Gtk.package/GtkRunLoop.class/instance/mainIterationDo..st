private
mainIterationDo: blocking
	^ self ffiCall: #( void gtk_main_iteration_do ( Boolean blocking ) )