private primitives
gtkInitArgC: argc argV: argv
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_init ( ulong argc, ulong argv ) )
	