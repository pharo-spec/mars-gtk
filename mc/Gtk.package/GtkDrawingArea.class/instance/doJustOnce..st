private
doJustOnce: aBlock
	"I ensure no draw can happen if I'm already drawing"
	GtkApplication uniqueInstance critical: aBlock