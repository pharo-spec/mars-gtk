class initialization
initialize 
	G_CONNECT_AFTER    := 1 << 0.
	G_CONNECT_SWAPPED  := 1 << 1.
	
	self initializeGdkModifierType.
	self initializeGtkAccelGroup