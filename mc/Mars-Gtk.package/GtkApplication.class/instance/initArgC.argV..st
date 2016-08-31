private
initArgC: argc argV: argv
	^ self ffiCall: #( void gtk_init ( ulong argc, ulong argv ) )