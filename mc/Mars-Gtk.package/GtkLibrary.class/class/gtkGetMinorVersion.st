private primitives
gtkGetMinorVersion
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: 'uint gtk_get_minor_version ( void )'