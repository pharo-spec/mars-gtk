class initialization
initializeGdkModifierType
	"This is not exhaustive, just the ones I use atm. 
	 this constants can be found at gdktypes.h"
	
	GDK_SHIFT_MASK    := 1 << 0.
	GDK_CONTROL_MASK  := 1 << 2.
	GDK_MOD1_MASK     := 1 << 3. "Alt, usually"
	GDK_META_MASK     := 1 << 28 "Command"
 