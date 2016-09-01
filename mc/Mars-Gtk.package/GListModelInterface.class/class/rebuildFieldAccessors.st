private
rebuildFieldAccessors
	"Prevent rebuild because I modify setters to keep callbacks (to prevent them to be GCed)"