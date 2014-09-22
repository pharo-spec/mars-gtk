private primitives
gtkGetMajorVersion
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: 'uint gtk_get_major_version ( void )'